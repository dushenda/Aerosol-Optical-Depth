function []=Al1(varargin)
%函数调用：
%1.输入一个句柄函数是Al1(handle)
%2.输入数组和方位函数是Al1(data,signNS,addEW)
narginchk(1,3);
if nargin==1
h1 = varargin{1};
[y,m,d,h,min,sec,lon,lat,pre,tem]=getPara(h1);
elseif nargin==3
data = varargin{1};
addEW = varargin{2};
signNS = varargin{3};
[y,m,d,h,min,sec,lon,lat,pre,tem]=readFile(data);
lon = lon+addEW;
lat = signNS*lat;
end

%需要转化为的数值或者其他常量
[theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
%算法第一步，计算s1=sin(omega*te),c1=cos(omega*te);
s1 = sin(omega*te);c1=cos(omega*te);
%算法第二步，计算s2=2*s1*c1,c2=(c1+s1)*(c1-s1)
s2=2*s1.*c1;c2=(c1+s1).*(c1-s1);
%算法第三步，计算赤经α
alpha = -1.38880+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2;
%算法第四步，把α转换到方便的范围:α→mod(α,2π)
alpha = mod(alpha,2*pi);                                 %根据算法用方便的范围代替，此时还是弧度
alphaAngle = alpha*180/pi;                                %转换到角度
%算法第五步，计算赤纬δ
delta = 6.57*10^(-3)+7.347*10^(-2)*s1-3.9919*10^(-1)*c1...
        +7.3*10^(-4)*s2-6.60*10^(-3)*c2;
deltaAngle = delta*180/pi;
%算法第六步，注意都要用弧度                              
H = 1.75283+6.3003881*t+theta-alpha;
%算法第七步,转到方便的范围H→mod(H+π，2π)-π
H = mod(H+pi,2*pi)-pi;
HAngle = H*180/pi;                                        %转角度输出
% %Final Step,几个算法都一样的
[GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre);

if nargin==1
outputPara(h1,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle);
elseif nargin==3
GammaAngle=GammaAngle(1,:);
zAngle=zAngle(1,:);
dataout = [alphaAngle;deltaAngle;HAngle;zAngle;GammaAngle];
dataout = dataout';
xlswrite('output',dataout);
end
end