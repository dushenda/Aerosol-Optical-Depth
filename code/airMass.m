function y = airMass(theta)
%�������ø�ʽ��airMass=massCal1(theta)
%�������˵����theta���춥�ǣ���λ�ǡ�
%�������˵����airMass�Ǵ�������
y = (cos(pi*theta/180)+0.15*(93.885-theta).^(-1.253)).^(-1);
end