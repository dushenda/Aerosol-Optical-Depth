function [y,m,d,H,M,S] = timeGet(DateTime)
% 从输入的DateTime组中获取时间信息
% 文中用的是北京时间，也就是北京当地时
DateTime.Hour = DateTime.Hour - 8;
y = DateTime.Year;
m = DateTime.Month;
d = DateTime.Day;
H = DateTime.Hour;
M = DateTime.Minute;
S = DateTime.Second;
end