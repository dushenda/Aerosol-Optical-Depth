% �����㷨�ļ������
clear;clc;
% �ϲ����ڣ���ȡ��Ϣ
digits
load('table.mat', 'new1');
new1.Date.Format = 'dd.MM.uuuu HH:mm';
new1.Time.Format = 'dd.MM.uuuu HH:mm';
x = new1.Date + timeofday(new1.Time);
[y,m,d,h,min,sec] = readDateTime(x);
data = [y,m,d,h,min,sec];
[GammaAngle1,zAngle1] = reportFun1(data);
[GammaAngle2,zAngle2] = reportFun2(data);
[GammaAngle3,zAngle3] = reportFun3(data);
[GammaAngle4,zAngle4] = reportFun4(data);
[GammaAngle5,zAngle5] = reportFun5(data);
Real = new1.Real;
y0 = new1.Real-new1.Calculate;
y1 = Real-zAngle1';
y2 = Real-zAngle2';
y3 = Real-zAngle3';
y4 = Real-zAngle4';
y5 = Real-zAngle5';
subplot(2,2,1);plot(x,y1);xlabel('ʱ��');ylabel('���');title('�㷨1');box off;grid on;
subplot(2,2,2);plot(x,y2);xlabel('ʱ��');ylabel('���');title('�㷨2');box off;grid on;
subplot(2,2,3);plot(x,y3);xlabel('ʱ��');ylabel('���');title('�㷨3');box off;grid on;
subplot(2,2,4);plot(x,y4);xlabel('ʱ��');ylabel('���');title('�㷨4');box off;grid on;
suptitle('�춥��ʵ��ֵ�����ֵ�����');
figure
subplot(2,1,1);plot(x,y0);xlabel('ʱ��');ylabel('���');title('�㷨0');box off;grid on;
subplot(2,1,2);plot(x,y5);xlabel('ʱ��');ylabel('���');title('�㷨5');box off;grid on;
suptitle('�춥��ʵ��ֵ�����ֵ�����');

