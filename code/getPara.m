function [y,m,d,h,min,sec,lon,lat,pre,tem]=getPara(handles)
%函数调用格式:[y,m,d,h,min,sec,lon,lat,pre,tem]=GetPara()
%从输入框中得到数值
y = str2num(get(handles.year,'string'));
m = str2num(get(handles.month,'string'));
d = str2num(get(handles.day,'string'));
h = str2num(get(handles.hour,'string'));
min = str2num(get(handles.minute,'string'));
sec = str2num(get(handles.second,'string'));
lon = str2num(get(handles.longitude,'string'));
lat = str2num(get(handles.latitude,'string'));
pre = str2num(get(handles.pressure,'string'));
tem = str2num(get(handles.temperature,'string'));
%分南北纬度，东西经度
global direction;                           
[addEW,signNS]=chooseDirection(direction);
lon = lon+addEW;
lat = signNS*lat;
end