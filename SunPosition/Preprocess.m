function [theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat)
%调用格式[theta,phi,omega,t,te]=Proprocess(y,m,d,h,min,sec,lon,lat)
%输出参数[经度弧度θ，纬度弧度φ，ω常数，与2060相距天数t，t加上Δτ后的te]
%输入参数(年year，月month，日day，时hour，分minute，秒second，经度longitude(°)，纬度latitude(°))
h = h+min/60+sec/3600;              %精确时间
theta = lon*pi/180;                 %theta表示经度的弧度
phi = lat*pi/180;                   %phi表示纬度的弧度
omega = 0.017202786;                %omega是算法给的，单位是day^(-1)
tau = 96.4+0.00158*(y-2060)*365;    %tau是前面用插值曲线计算的，代表论文中的Δτ
if(m<=2)                            %根据前面的描述，如果月份小于2，那么月份+2，年份-1
    m=m+12;
    y=y-1;
end
%根据算法1中的公式计算
%根据论文，也通过验证，代码没问题，下式的t是距离2060的天数，小的为-，大的为+
t = fix(365.25*(y-2000))+fix(30.6001*(m+1))-fix(0.01*y)+d+h/24-21958;
%te就是基于TT独立于地球转动，下面都用这个te来建立全局太阳位置
te = t+1.574*10^(-5)*tau;
end