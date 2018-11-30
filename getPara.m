function [y,m,d,h,min,sec,lon,lat,pre,tem]=getPara(handles)
%�������ø�ʽ:[y,m,d,h,min,sec,lon,lat,pre,tem]=GetPara()
%��������еõ���ֵ
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
%���ϱ�γ�ȣ���������
global direction;                           
[addEW,signNS]=chooseDirection(direction);
lon = lon+addEW;
lat = signNS*lat;
end