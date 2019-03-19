function y=massCal(gamma)
%函数调用格式：airMass=massCal1(gamma)
%输入参数说明：gamma是天顶角，单位是°
%输出参数说明：airMass是大气质量
a=0.1500;b=3.885;c=1.253;
gamma = 90 - gamma;
% 计算采用高度角
% gamma=gamma*pi/180;%b=b*pi/180;
y=(sin(gamma*pi/180)+a*(gamma+b).^(-c)).^(-1);
end