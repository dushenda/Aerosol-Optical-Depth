function [y,m,d,h,min,sec] = readDateTime(datetime)
% 提取日期数组中的年月日时分秒
y = datetime.Year;
m = datetime.Month;
d = datetime.Day;
h = datetime.Hour;
min = datetime.Minute;
sec = datetime.Second;
end