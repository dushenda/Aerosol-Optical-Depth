function []=Al3(varargin)

narginchk(1,3);
if nargin==1
h3 = varargin{1};
[y,m,d,h,min,sec,lon,lat,pre,tem]=getPara(h3);
elseif nargin==3
data = varargin{1};
addEW = varargin{2};
signNS = varargin{3};
[y,m,d,h,min,sec,lon,lat,pre,tem]=readFile(data);
lon = lon+addEW;
lat = signNS*lat;
end


%需要转化为的数值或者其他常量
[theta,phi,~,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
[~,col]=size(te);
omegaa = 0.0172019715;
%Step1
lambda = -1.388803*ones(1,col)+1.720279216*10^(-2)*te+3.3366*10^(-2)...
         *sin(omegaa*te-0.06172)+3.53*10^(-4)*sin(2*omegaa*te-0.1163);
%Step2
epsilon = 4.089567*10^(-1)*ones(1,col)-6.19*10^(-9)*te;
%Step3
slambda=sin(lambda);clambda=cos(lambda);
%Step4
sepsilon=sin(epsilon);cepsilon=sqrt(1-sepsilon.^(2));
%Step5
alpha = atan2(slambda.*cepsilon,clambda);
%Step6
if(alpha<0)
    alpha = alpha+2*pi;
end
%Step7
delta = asin(slambda.*sepsilon);
%Step8
H = 1.75283*ones(1,col)+6.3003881*t+theta-alpha;
H = mod(H+pi*ones(1,col),2*pi)-pi*ones(1,col);
alphaAngle = alpha*180/pi;
deltaAngle = delta*180/pi;
HAngle = H*180/pi;
[GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre);

if nargin==1
outputPara(h3,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle);
elseif nargin==3
GammaAngle=GammaAngle(1,:);
zAngle=zAngle(1,:);
dataout = [alphaAngle;deltaAngle;HAngle;zAngle;GammaAngle];
dataout = dataout';
xlswrite('output',dataout);
end
end