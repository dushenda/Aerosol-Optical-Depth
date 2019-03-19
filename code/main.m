clear;clc
data = xlsread('D:\干活\20180807.csv');
[row,col] = size(data);
date = datetime('2018-08-07');
% 获取时刻变量
time = data(:,1);
time = days(time);
time.Format = 'hh:mm:ss';
% 获取各通道的值
channel2_412 = data(:,3);
channel3_500 = data(:,4);
channel5_675 = data(:,6);
channel6_862 = data(:,7);
channel8_1024 = data(:,9);
% x=m(θ),计算天顶角
% 定义一些计算天顶角需要的物理量
tem = data(:,11);
pre = data(:,14);
pre = pre*100/(1.013*10^5);
lon = 94.41;lat = 40.09;
% 组成数据输入矩阵
date = repmat(date,[row,1]);
datetimer = datenum(date+time);
lon = repmat(lon,[row,1]);lat=repmat(lat,[row,1]);
datain = [datetimer,lon,lat,pre,tem];
% 计算天顶角
[~,zAngle] = reportFun5(datain);
% 去除天顶角大于90的数据
if_zAngle_bigger_85 = (zAngle<85);
zAngle = zAngle(if_zAngle_bigger_85);
datetimer = datetimer(if_zAngle_bigger_85);
channel2_412 = channel2_412(if_zAngle_bigger_85);
channel3_500 = channel3_500(if_zAngle_bigger_85);
channel5_675 = channel5_675(if_zAngle_bigger_85);
channel6_862 = channel6_862(if_zAngle_bigger_85);
channel8_1024 = channel8_1024(if_zAngle_bigger_85);
% 计算大气质量
airMass = airMass(zAngle);
% 计算日地修正系数
datetimer = datetime(datetimer,'ConvertFrom','datenum');
d0d = fEartoSun(datetimer);
% 确定x，y
x = airMass;
y1 = log(channel2_412./d0d);
y2 = log(channel3_500./d0d);
plot(x,y1);hold on
plot(x,y2);box off;grid on
xlabel('大气质量');ylabel('ln(DN(\lambda)/(d_0/d)^2)');
title('拟合曲线');
% xlswrite('test.xlsx',[zAngle';airMass',channel2_412,channel3_500,channel5_675,channel6_862...
%     channel8_1024])