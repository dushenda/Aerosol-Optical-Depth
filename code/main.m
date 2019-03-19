clear;clc
data = xlsread('D:\�ɻ�\20180807.csv');
[row,col] = size(data);
date = datetime('2018-08-07');
% ��ȡʱ�̱���
time = data(:,1);
time = days(time);
time.Format = 'hh:mm:ss';
% ��ȡ��ͨ����ֵ
channel2_412 = data(:,3);
channel3_500 = data(:,4);
channel5_675 = data(:,6);
channel6_862 = data(:,7);
channel8_1024 = data(:,9);
% x=m(��),�����춥��
% ����һЩ�����춥����Ҫ��������
tem = data(:,11);
pre = data(:,14);
pre = pre*100/(1.013*10^5);
lon = 94.41;lat = 40.09;
% ��������������
date = repmat(date,[row,1]);
datetimer = datenum(date+time);
lon = repmat(lon,[row,1]);lat=repmat(lat,[row,1]);
datain = [datetimer,lon,lat,pre,tem];
% �����춥��
[~,zAngle] = reportFun5(datain);
% ȥ���춥�Ǵ���90������
if_zAngle_bigger_85 = (zAngle<85);
zAngle = zAngle(if_zAngle_bigger_85);
datetimer = datetimer(if_zAngle_bigger_85);
channel2_412 = channel2_412(if_zAngle_bigger_85);
channel3_500 = channel3_500(if_zAngle_bigger_85);
channel5_675 = channel5_675(if_zAngle_bigger_85);
channel6_862 = channel6_862(if_zAngle_bigger_85);
channel8_1024 = channel8_1024(if_zAngle_bigger_85);
% �����������
airMass = airMass(zAngle);
% �����յ�����ϵ��
datetimer = datetime(datetimer,'ConvertFrom','datenum');
d0d = fEartoSun(datetimer);
% ȷ��x��y
x = airMass;
y1 = log(channel2_412./d0d);
y2 = log(channel3_500./d0d);
plot(x,y1);hold on
plot(x,y2);box off;grid on
xlabel('��������');ylabel('ln(DN(\lambda)/(d_0/d)^2)');
title('�������');
% xlswrite('test.xlsx',[zAngle';airMass',channel2_412,channel3_500,channel5_675,channel6_862...
%     channel8_1024])