% �������㷨�ļ������
clear;clc;
% �ϲ����ڣ���ȡ��Ϣ
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
xlabel('ʱ��');ylabel('���');
title('�춥��ʵ��ֵ�����ֵ�����');
figure
plot(x,Real,'k');hold on
plot(x,zAngle,'m');box off;grid on
xlabel('ʱ��');ylabel('�춥��');
title('������춥�Ǻ�ʵ��ֵ');legend('ʵ��ֵ','����ֵ');
figure
subplot(2,1,1);hist(y);box off;grid on
xlabel('���');ylabel('��������');
title('Ƶ���ֲ�ֱ��ͼ');
[n,xout]=hist(y);
subplot(2,1,2);bar(xout,n/length(y));box off;grid on
xlabel('���');ylabel('Ƶ��');
title('Ƶ�ʷֲ�ֱ��ͼ');
suptitle('2018��8��7���춥�����');

