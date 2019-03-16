function [y,m,d,h,min,sec,lon,lat,pre,tem] = readFile(data)
[~,col] = size(data);
if (col==5)
    t = datetime(data(:,1),'ConvertFrom','datenum');
    y = t.Year;
    m = t.Month;
    d = t.Day;
    h = t.Hour;
    min = t.Minute;
    sec= t.Second;
    lon = data(:,2);
    lat = data(:,3);
    pre = data(:,4);
    tem = data(:,5);
else
y = data(:,1);
m = data(:,2);
d = data(:,3);
h = data(:,4);
min = data(:,5);
sec = data(:,6);
if(col>6)
lon = data(:,7);
lat = data(:,8);
pre = data(:,9);
tem = data(:,10);
else
    [lon,lat,pre,tem] = definePara();
end
end
y=y';
m=m';
d=d';
h=h';
min=min';
sec=sec';
lon=lon';
pre=pre';
tem=tem';
end