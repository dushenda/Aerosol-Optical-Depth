clear;clc
T = datetime(2020,1,25,0:23,0,0);
[GammaAngle,zAngle] = angelGet5(T);
z = zAngle*pi/180;
Gamma = GammaAngle*pi/180;