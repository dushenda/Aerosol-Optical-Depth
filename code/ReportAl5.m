% 第三种算法的计算误差
clear;clc;
% 合并日期，提取信息
load('table.mat', 'new1');
new1.Date.Format = 'dd.MM.uuuu HH:mm';
new1.Time.Format = 'dd.MM.uuuu HH:mm';
x = new1.Date + timeofday(new1.Time);
j=1;
[y,m,d,h,min,sec] = readDateTime(x);
data = [y,m,d,h,min,sec];
[GammaAngle,zAngle] = reportFun5(data);
Real = new1.Real;
y= Real-zAngle';
p = find(x.Day==7);         
x = x(p);y=y(p);
Real = Real(p);zAngle=zAngle(p);
plot(x,y,'.');box off;grid on
xlabel('时间');ylabel('误差');
title('天顶角实际值与计算值的误差');
figure
plot(x,Real,'k');hold on
plot(x,zAngle,'m');box off;grid on
xlabel('时间');ylabel('天顶角');
title('计算的天顶角和实际值');legend('实际值','计算值');
figure
subplot(2,1,1);hist(y);box off;grid on
xlabel('误差');ylabel('误差点数量');
title('频数分布直方图');
[n,xout]=hist(y);
subplot(2,1,2);bar(xout,n/length(y));box off;grid on
xlabel('误差');ylabel('频率');
title('频率分布直方图');
suptitle('2018年8月7日天顶角误差');

