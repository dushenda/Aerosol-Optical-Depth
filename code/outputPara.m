function []=outputPara(handles,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle)
%�������ø�ʽ:OutputPara(handles,alphaAngle,deltaAngle,HAngle,GammaAngle,zAngle)
%����������
set(handles.RightAscension,'string',num2str(alphaAngle)); %�����GUI
set(handles.Declination,'string',num2str(deltaAngle));
set(handles.HourAngle,'string',num2str(HAngle));
set(handles.Azimuth,'string',num2str(GammaAngle));
set(handles.Zenith,'string',num2str(zAngle));
end