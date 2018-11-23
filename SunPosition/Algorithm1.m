function [alphaAngle,deltaAngle,HAngle,zAngle,GammaAngle]=Algorithm1(y,m,d,h,min,sec,lon,lat,pre,tem)
%�㷨1���ø�ʽ��[alpha,delta,H,z,Gamma]=Algorithm1(y,m,d,h,min,sec,lon,lat,pre,tem)
%�������Ϊ[�ྭRightAscension,��γDeclination,ʱ��HourAngle,�춥��Zenith,��λ��Aznith]
%�������(��year,��month,��day,ʱhour����minute,��second������longitude(��),γ��latitude(��)��ѹǿpressure(atm)���¶�temperature(��))
[theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
%�㷨��һ��������s1=sin(omega*te),c1=cos(omega*te);
s1 = sin(omega*te);c1=cos(omega*te);
%�㷨�ڶ���������s2=2*s1*c1,c2=(c1+s1)*(c1-s1)
s2=2*s1*c1;c2=(c1+s1)*(c1-s1);
%�㷨������������ྭ��
alpha = -1.38880+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2;
%�㷨���Ĳ����Ѧ�ת��������ķ�Χ:����mod(��,2��)
alpha = mod(alpha,2*pi);                                  %�����㷨�÷���ķ�Χ���棬��ʱ���ǻ���
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
%Final Step
[GammaAngle,zAngle]=FinalStep(phi,delta,H,tem,pre);
end