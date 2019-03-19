function y = airMass(theta)
%函数调用格式：airMass=massCal1(theta)
%输入参数说明：theta是天顶角，单位是°
%输出参数说明：airMass是大气质量
y = (cos(pi*theta/180)+0.15*(93.885-theta).^(-1.253)).^(-1);
end