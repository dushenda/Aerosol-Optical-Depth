function []=Al1(varargin)
%�������ã�
%1.����һ�����������Al1(handle)
%2.��������ͷ�λ������Al1(data,signNS,addEW)
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

%��Ҫת��Ϊ����ֵ������������
[theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
%�㷨��һ��������s1=sin(omega*te),c1=cos(omega*te);
s1 = sin(omega*te);c1=cos(omega*te);
%�㷨�ڶ���������s2=2*s1*c1,c2=(c1+s1)*(c1-s1)
s2=2*s1.*c1;c2=(c1+s1).*(c1-s1);
%�㷨������������ྭ��
alpha = -1.38880+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2;
%�㷨���Ĳ����Ѧ�ת��������ķ�Χ:����mod(��,2��)
alpha = mod(alpha,2*pi);                                 %�����㷨�÷���ķ�Χ���棬��ʱ���ǻ���
alphaAngle = alpha*180/pi;                                %ת�����Ƕ�
%�㷨���岽�������γ��
delta = 6.57*10^(-3)+7.347*10^(-2)*s1-3.9919*10^(-1)*c1...
        +7.3*10^(-4)*s2-6.60*10^(-3)*c2;
deltaAngle = delta*180/pi;
%�㷨��������ע�ⶼҪ�û���                              
H = 1.75283+6.3003881*t+theta-alpha;
%�㷨���߲�,ת������ķ�ΧH��mod(H+�У�2��)-��
H = mod(H+pi,2*pi)-pi;
HAngle = H*180/pi;                                        %ת�Ƕ����
% %Final Step,�����㷨��һ����
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