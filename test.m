clear;clc;
fileID = fopen('C:\Users\dushenda\Desktop\new.txt');
C = textscan(fileID,'%f %1s %f %1s %f %f %1s %f %1s %f %f');
fclose(fileID);
d=C{1};m=C{3};y=C{5};h=C{6};min=C{8};sec=C{10};
real=cast(C{11},'double');
[row,col]=size(d);
lon=ones(row,col)*94.01;lat=ones(row,col)*40.09;
pre=ones(row,col)*0.87;tem=ones(row,col)*25;
data=[y,m,d,h,min,sec,lon,lat,pre,tem];
Al4(data,0,1);
range=['F1:F',num2str(row)];
xlswrite('output',real,range);
analysis();