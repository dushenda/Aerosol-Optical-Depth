function [GammaAngle,zAngle] = angelGet5(DateTime)
[lon,lat,pre,tem] = definePara();
[y,m,d,H,M,S] = timeGet(DateTime);
[theta,phi,~,t,te] = Preprocess(y,m,d,H,M,S,lon,lat);
%确定常数
L0 = 1.7527901;
L1 = 1.7202792159*10^(-2);
omegaa = 0.0172019715;
beta = 2.92*10^(-5);
omegan = 9.282*10^(-4);
omega = [1.49*10^(-3),4.31*10^(-3),1.076*10^(-2),1.575*10^(-2),...
         2.152*10^(-2),3.152*10^(-2),2.1277*10^(-1)];
a = [3.33024*10^(-2),3.512*10^(-4),5.2*10^(-6)];
dbeta = -8.23*10^(-5);
d = [1.27,1.21,2.33,3.49,2.67,1.28,3.14]*10^(-5);
b = [-2.0582*10^(-3),-4.07*10^(-5),-9*10^(-7)];
Phi = [-2.337,3.065,-1.533,-2.358,0.074,1.547,-0.488];
     
[~,volume]=size(te);
s1=sin(omegaa*te);c1=cos(omegaa*te);
s2=2*s1.*c1;c2=(c1+s1).*(c1-s1);
s3=s2.*c1+c2.*s1;c3=c2.*c1-s2.*s1;
Sigma7=0;
for i=1:7
    Sigma7=Sigma7+d(i)*sin(omega(i)*te+Phi(i)*ones(1,volume));
end
L=L0*ones(1,volume)+L1*te+(a(1)*s1+a(2)*s2+a(3)*s3+b(1)*c1+b(2)*c2+b(3)*c3)...
    +dbeta*s1.*sin(beta*te)+Sigma7;
nu=omegan*te-0.8;
deltalambda=8.34*10^(-5)*sin(nu);
lambda=L+pi*ones(1,volume)+deltalambda;
slambda=sin(lambda);clambda=cos(lambda);
epsilon = 4.089567*10^(-1)*ones(1,volume)-6.19*10^(-9)*te+4.46*10^(-5)*cos(nu);
sepsilon=sin(epsilon);cepsilon=sqrt(1-sepsilon.^(2));
alpha=atan2(slambda.*cepsilon,clambda);
for i=1:volume
if alpha(i)<0
    alpha(i)=alpha(i)+2*pi;
end
end
delta=asin(slambda.*sepsilon);
H = 1.7528311*ones(1,volume,1)+6.300388099*t+theta-alpha+0.92*deltalambda;
H = mod(H+pi*ones(1,volume),2*pi)-pi*ones(1,volume);
% deltaAngle=delta*180/pi;
% HAngle=H*180/pi;
% alphaAngle=alpha*180/pi;
[GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre);
[zrow,zcol] = size(zAngle);
if(zrow>1&&zcol>1)
    zAngle = zAngle(1,:);
    GammaAngle = GammaAngle(1,:);
end
% zAngle(find(zAngle>90)) = zAngle(find(zAngle>90)) - 90;
% zAngle = zAngle - (zAngle>90)*90;
end