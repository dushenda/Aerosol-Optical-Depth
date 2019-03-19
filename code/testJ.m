clear;clc
gamma=0:0.1:90;
z=90-gamma;
y = (cos(pi*gamma/180)+0.15*((93.885-gamma).^(-1.253))).^(-1);
plot(z,y)