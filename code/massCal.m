function y=massCal(gamma)
%�������ø�ʽ��airMass=massCal1(gamma)
%�������˵����gamma���춥�ǣ���λ�ǡ�
%�������˵����airMass�Ǵ�������
a=0.1500;b=3.885;c=1.253;
gamma = 90 - gamma;
% ������ø߶Ƚ�
% gamma=gamma*pi/180;%b=b*pi/180;
y=(sin(gamma*pi/180)+a*(gamma+b).^(-c)).^(-1);
end