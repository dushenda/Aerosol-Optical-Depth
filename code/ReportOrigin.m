% 黄东师兄的计算误差
% 合并时间日期
load table.mat
new1.Date.Format = 'dd.MM.uuuu HH:mm';
new1.Time.Format = 'dd.MM.uuuu HH:mm';
x = new1.Date + timeofday(new1.Time);
% 计算误差
y = new1.Real-new1.Calculate;
% 画图
plot(x,y);
xlabel('时间');ylabel('误差');
title('天顶角实际值与计算值的误差');
box off
grid on

