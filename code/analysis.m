function []=analysis()
data=xlsread('output');
y1=data(:,4);               %计算的数据
y2=data(:,6);               %给的标准数据
deltay=y2-y1;               %计算差值
volume=max(size(y1));
y1(volume)=[];y2(volume)=[];deltay(volume)=[];
%读入文件
fileID = fopen('C:\Users\dushenda\Desktop\new.txt');
C = textscan(fileID,'%f %1s %f %1s %f %f %1s %f %1s %f %f');
fclose(fileID);
%绘制时间误差曲线
d=C{1};m=C{3};y=C{5};h=C{6};min=C{8};sec=C{10};
t=datetime(y,m,d,h,min,sec);
plot(t,[y1,y2]);
title('天顶角计算与标准数据');
xlabel('日期');ylabel('天顶角');
legend('计算的天顶角','标准的天顶角');
figure(2)
plot(t,deltay);
title('天顶角误差计算');
ylabel('误差');xlabel('日期');
end