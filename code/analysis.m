function []=analysis()
data=xlsread('output');
y1=data(:,4);               %���������
y2=data(:,6);               %���ı�׼����
deltay=y2-y1;               %�����ֵ
volume=max(size(y1));
y1(volume)=[];y2(volume)=[];deltay(volume)=[];
%�����ļ�
fileID = fopen('C:\Users\dushenda\Desktop\new.txt');
C = textscan(fileID,'%f %1s %f %1s %f %f %1s %f %1s %f %f');
fclose(fileID);
%����ʱ���������
d=C{1};m=C{3};y=C{5};h=C{6};min=C{8};sec=C{10};
t=datetime(y,m,d,h,min,sec);
plot(t,[y1,y2]);
title('�춥�Ǽ������׼����');
xlabel('����');ylabel('�춥��');
legend('������춥��','��׼���춥��');
figure(2)
plot(t,deltay);
title('�춥��������');
ylabel('���');xlabel('����');
end