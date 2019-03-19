clear;clc;
data = xlsread('D:\干活\psr1\20180905.csv');
% 日期时间处理
date = '20180905';
date = datetime(str2double(date(1:4)),str2double(date(5:6)),str2double(date(7:8)));
[row,col] = size(data);
date = repmat(date,[row,1]);
time = datetime(data(:,1),'ConvertFrom','excel');
DateTime = date + timeofday(time);
% 定义D0,DN0数值入下
% D365_0 = 63484;
% D412_0 = 68577;
% D500_0 = 61448;
% D610_0 = 57414;
% D675_0 = 64450;
% D862_0 = 61584;
% D940_0 = 92456;
% D1024_0 = 56634;
DN0 = [63484, 68577, 61448, 57414, 64450, 61584, 92456, 56643];
d_d0 = fEartoSun(DateTime);
[GammaAngle,zAngle] = angelGet5(DateTime);
%%
% look the distribution of zenith
figure(1)
plot(DateTime,zAngle,'.');
box off;grid on;
xlabel('Local Time (Beijing)');ylabel('Zenith(°)');
title('Zenith')
%%
% Air Mass
AirMass = massCal(zAngle);
figure
figure(2)
plot(DateTime,AirMass,'.');
box off;grid on;
xlabel('Local Time (Beijing)');ylabel('Air Mass');title('Air Mass')
%% eight channels
DN_365 = data(:,2);
DN_412 = data(:,3);
DN_500 = data(:,4);
DN_610 = data(:,5);
DN_675 = data(:,6);
DN_862 = data(:,7);
DN_940 = data(:,8);
DN_1024= data(:,9);
%%
% λ=412nm
tau_total412 = getTautotal(DN0(2), DN_412, d_d0, AirMass);
tau_r412 = getTaur(412,879.6,1.138);
tau_aero412 = tau_total412 - tau_r412;
%%
% λ=500nm
tau_total500 = getTautotal(DN0(3), DN_500, d_d0, AirMass);
tau_r500 = getTaur(500,879.6,1.138);
tau_aero500 = tau_total500 - tau_r500;
%%
% λ=675nm
tau_total675 = getTautotal(DN0(5), DN_675, d_d0, AirMass);
tau_r675 = getTaur(675,879.6,1.138);
tau_aero675 = tau_total675 - tau_r675;
%%
% λ=862nm
tau_total862 = getTautotal(DN0(6), DN_862, d_d0, AirMass);
tau_r862 = getTaur(862,879.6,1.138);
tau_aero862 = tau_total862 - tau_r862;
%%
% λ=1024nm
tau_total1024 = getTautotal(DN0(8), DN_365, d_d0, AirMass);
tau_r1024 = getTaur(1024,879.6,1.138);
tau_aero1024 = tau_total1024 - tau_r1024;
%%
% figure
figure(3)
y = [tau_aero412, tau_aero500, tau_aero675, tau_aero862, tau_aero1024];
p = plot(DateTime,y,'.');
box off;grid on;
xlabel('Local Time (Beijing)');ylabel('Optical Depth');
title('Aerosol Optical Depth');
legend('λ=412nm','λ=500nm','λ=675nm','λ=862nm','λ=1024nm');
% print('0810','-dpng','-r0');
%%
% for test the fit of Calibration
figure(4)
y = log(DN_412./d_d0);
p = find(AirMass>10);
y(p)=[];AirMass(p)=[];
plot(AirMass,y,'.');
box off;grid on;
xlabel('Air Mass');ylabel('ln(V) + ln(d_s^2)');title('Calibration Curve in 2018-8-7 (\lambda=412nm)');
createFit(AirMass,y);