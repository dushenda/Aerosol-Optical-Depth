function [y,m,d,h,min,sec] = readDateTime(datetime)
% ��ȡ���������е�������ʱ����
y = datetime.Year;
m = datetime.Month;
d = datetime.Day;
h = datetime.Hour;
min = datetime.Minute;
sec = datetime.Second;
end