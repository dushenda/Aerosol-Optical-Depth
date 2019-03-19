% 第三种算法的计算误差
clear;clc;
% 合并日期，提取信息
load('table.mat', 'new1');
new1.Date.Format = 'dd.MM.uuuu HH:mm';
new1.Time.Format = 'dd.MM.uuuu HH:mm';
x = new1.Date + timeofday(new1.Time);
[y,m,d,h,min,sec] = readDateTime(x);
data = [y,m,d,h,min,sec];
[GammaAngle,zAngle] = reportFun3(data);
Real = new1.Real;
y = Real-zAngle';
plot(x,y);
xlabel('时间');ylabel('误差');
title('天顶角实际值与计算值的误差');
box off
grid on