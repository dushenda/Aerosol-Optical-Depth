function []=outputPara(handles,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle)
%函数调用格式:OutputPara(handles,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle)
%输出到输出框
set(handles.RightAscension,'string',num2str(alphaAngle)); %输出到GUI
set(handles.Declination,'string',num2str(deltaAngle));
set(handles.HourAngle,'string',num2str(HAngle));
set(handles.Azimuth,'string',num2str(GammaAngle));
set(handles.Zenith,'string',num2str(zAngle));
end