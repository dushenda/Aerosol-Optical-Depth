function [y,m,d,H,M,S] = timeGet(DateTime)
% �������DateTime���л�ȡʱ����Ϣ
% �����õ��Ǳ���ʱ�䣬Ҳ���Ǳ�������ʱ
DateTime.Hour = DateTime.Hour - 8;
y = DateTime.Year;
m = DateTime.Month;
d = DateTime.Day;
H = DateTime.Hour;
M = DateTime.Minute;
S = DateTime.Second;
end