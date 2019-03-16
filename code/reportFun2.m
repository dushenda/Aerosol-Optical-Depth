function [GammaAngle,zAngle] = reportFun2(data)
[y,m,d,h,min,sec,lon,lat,pre,tem]=readFile(data);
[theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
[~,col]=size(te);
%Step1
s1=sin(omega*te);c1=cos(omega*te);
%Step2
s2=2*s1.*c1;c2=(c1+s1).*(c1-s1);
%Step3
s3=s2.*c1+c2.*s1;c3=c2.*c1-s2.*s1;
%Step4
s4=2*s2.*c2;c4=(c2+s2).*(c2-s2);
%Step5
alpha = -1.38880*ones(1,col)+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2...
        +1.33*10^(-3)*s3+3.8*10^(-4)*c3+7.3*10^(-4)*s4+6.2*10^(-4)*c4;
%Step6
alpha = mod(alpha,2*pi);
%Step7
delta = 6.57*10^(-3)*ones(1,col)+7.347*10^(-2)*s1-3.9919*10^(-1)*c1...
        +7.3*10^(-4)*s2-6.60*10^(-3)*c2+1.50*10^(-3)*s3...
        -2.58*10^(-3)*c3+6*10^(-5)*s4-1.3*10^(-4)*c4;
%Step8
H = 1.75283*ones(1,col)+6.3003881*t+theta-alpha;
H = mod(H+pi*ones(1,col),2*pi)-pi*ones(1,col);
alphaAngle = alpha*180/pi;
deltaAngle = delta*180/pi;
HAngle = H*180/pi;
[GammaAngle,zAngle]=finalStep(phi,delta,H,tem,pre);
end