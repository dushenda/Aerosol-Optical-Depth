% �������㷨�ļ������
clear;clc;
% �ϲ����ڣ���ȡ��Ϣ
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
xlabel('ʱ��');ylabel('���');
title('�춥��ʵ��ֵ�����ֵ�����');
box off
grid on