function [alphaAngle,deltaAngle,HAngle,zAngle,GammaAngle]=Algorithm1(y,m,d,h,min,sec,lon,lat,pre,tem)
%算法1调用格式：[alpha,delta,H,z,Gamma]=Algorithm1(y,m,d,h,min,sec,lon,lat,pre,tem)
%输出参数为[赤经RightAscension,赤纬Declination,时角HourAngle,天顶角Zenith,方位角Aznith]
%输入参数(年year,月month,日day,时hour，分minute,秒second，经度longitude(°),纬度latitude(°)，压强pressure(atm)，温度temperature(℃))
[theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat);
%算法第一步，计算s1=sin(omega*te),c1=cos(omega*te);
s1 = sin(omega*te);c1=cos(omega*te);
%算法第二步，计算s2=2*s1*c1,c2=(c1+s1)*(c1-s1)
s2=2*s1*c1;c2=(c1+s1)*(c1-s1);
%算法第三步，计算赤经α
alpha = -1.38880+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2;
%算法第四步，把α转换到方便的范围:α→mod(α,2π)
alpha = mod(alpha,2*pi);                                  %根据算法用方便的范围代替，此时还是弧度
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
%Final Step
[GammaAngle,zAngle]=FinalStep(phi,delta,H,tem,pre);
end