function []=Al4(varargin)

narginchk(1,3);
if nargin==1
h4 = varargin{1};
[y,m,d,h,min,sec,lon,lat,pre,tem]=getPara(h4);
elseif nargin==3
data = varargin{1};
addEW = varargin{2};
signNS = varargin{3};
[y,m,d,h,min,sec,lon,lat,pre,tem]=readFile(data);
lon = lon+addEW;
lat = signNS*lat;
end


[theta,phi,~,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
[~,col]=size(te);
omegaa = 0.0172019715;
omegan = 9.282*10^(-4);
%Step1
L = 1.752790*ones(1,col)+1.720279216*10^(-2)*te+3.3366*10^(-2)...
    *sin(omegaa*te-0.06172)+3.53*10^(-4)*sin(2*omegaa*te-0.1163);
%Step2
nu = omegan*te-0.8;
%Step3
deltalambda = 8.34*10^(-5)*sin(nu);
%Step4
lambda = L.*ones(1,col)+pi*ones(1,col)+deltalambda;
%Step5
epsilon = 4.089567*10^(-1)*ones(1,col)-6.19*10^(-9)*te+4.46*10^(-5)*cos(nu);
%Step6
slambda=sin(lambda);clambda=cos(lambda);
%Step7
sepsilon=sin(epsilon);cepsilon=cos(epsilon);
%Step8
alpha = atan2(slambda.*cepsilon,clambda);
%Step9
if(alpha<0)
    alpha = alpha+2*pi;
end
%Step10
delta = asin(slambda.*sepsilon);
%Step11
H = 1.7528311*ones(1,col)+6.300388099*t+theta-alpha+0.92*deltalambda;
H = mod(H+pi*ones(1,col),2*pi)-pi*ones(1,col);
alphaAngle = alpha*180/pi;
deltaAngle = delta*180/pi;
HAngle = H*180/pi;
[GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre);

if nargin==1
outputPara(h4,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle);
elseif nargin==3
GammaAngle=GammaAngle(1,:);
zAngle=zAngle(1,:);
dataout = [alphaAngle;deltaAngle;HAngle;zAngle;GammaAngle];
dataout = dataout';
xlswrite('output',dataout);
end
end