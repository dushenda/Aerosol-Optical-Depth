% �ƶ�ʦ�ֵļ������
% �ϲ�ʱ������
load table.mat
new1.Date.Format = 'dd.MM.uuuu HH:mm';
new1.Time.Format = 'dd.MM.uuuu HH:mm';
x = new1.Date + timeofday(new1.Time);
% �������
y = new1.Real-new1.Calculate;
% ��ͼ
plot(x,y);
xlabel('ʱ��');ylabel('���');
title('�춥��ʵ��ֵ�����ֵ�����');
box off
grid on

