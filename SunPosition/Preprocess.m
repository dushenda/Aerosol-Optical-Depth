function [theta,phi,omega,t,te]=Preprocess(y,m,d,h,min,sec,lon,lat)
%���ø�ʽ[theta,phi,omega,t,te]=Proprocess(y,m,d,h,min,sec,lon,lat)
%�������[���Ȼ��Ȧȣ�γ�Ȼ��Ȧգ��س�������2060�������t��t���Ϧ��Ӻ��te]
%�������(��year����month����day��ʱhour����minute����second������longitude(��)��γ��latitude(��))
h = h+min/60+sec/3600;              %��ȷʱ��
theta = lon*pi/180;                 %theta��ʾ���ȵĻ���
phi = lat*pi/180;                   %phi��ʾγ�ȵĻ���
omega = 0.017202786;                %omega���㷨���ģ���λ��day^(-1)
tau = 96.4+0.00158*(y-2060)*365;    %tau��ǰ���ò�ֵ���߼���ģ����������еĦ���
if(m<=2)                            %����ǰ�������������·�С��2����ô�·�+2�����-1
    m=m+12;
    y=y-1;
end
%�����㷨1�еĹ�ʽ����
%�������ģ�Ҳͨ����֤������û���⣬��ʽ��t�Ǿ���2060��������С��Ϊ-�����Ϊ+
t = fix(365.25*(y-2000))+fix(30.6001*(m+1))-fix(0.01*y)+d+h/24-21958;
%te���ǻ���TT�����ڵ���ת�������涼�����te������ȫ��̫��λ��
te = t+1.574*10^(-5)*tau;
end