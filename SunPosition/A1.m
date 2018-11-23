function varargout = A1(varargin)
% A1 MATLAB code for A1.fig
%      A1, by itself, creates a new A1 or raises the existing
%      singleton*.
%
%      H = A1 returns the handle to a new A1 or the handle to
%      the existing singleton*.
%
%      A1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A1.M with the given input arguments.
%
%      A1('Property','Value',...) creates a new A1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A1

% Last Modified by GUIDE v2.5 23-Nov-2018 14:25:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A1_OpeningFcn, ...
                   'gui_OutputFcn',  @A1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end
 
if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before A1 is made visible.
function A1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A1 (see VARARGIN)

% Choose default command line output for A1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function year_Callback(hObject, eventdata, handles)
y = (get(hObject,'string'));

% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of year as text
%        str2double(get(hObject,'String')) returns contents of year as a double


% --- Executes during object creation, after setting all properties.
function year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of month as text
%        str2double(get(hObject,'String')) returns contents of month as a double


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day as text
%        str2double(get(hObject,'String')) returns contents of day as a double


% --- Executes during object creation, after setting all properties.
function day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hour_Callback(hObject, eventdata, handles)
% hObject    handle to hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hour as text
%        str2double(get(hObject,'String')) returns contents of hour as a double


% --- Executes during object creation, after setting all properties.
function hour_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hour (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minute_Callback(hObject, eventdata, handles)
% hObject    handle to minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minute as text
%        str2double(get(hObject,'String')) returns contents of minute as a double


% --- Executes during object creation, after setting all properties.
function minute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function second_Callback(hObject, eventdata, handles)
% hObject    handle to second (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of second as text
%        str2double(get(hObject,'String')) returns contents of second as a double


% --- Executes during object creation, after setting all properties.
function second_CreateFcn(hObject, eventdata, handles)
% hObject    handle to second (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function longitude_Callback(hObject, eventdata, handles)
% hObject    handle to longitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of longitude as text
%        str2double(get(hObject,'String')) returns contents of longitude as a double


% --- Executes during object creation, after setting all properties.
function longitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to longitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function latitude_Callback(hObject, eventdata, handles)
% hObject    handle to latitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of latitude as text
%        str2double(get(hObject,'String')) returns contents of latitude as a double


% --- Executes during object creation, after setting all properties.
function latitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4



function pressure_Callback(hObject, eventdata, handles)
% hObject    handle to pressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pressure as text
%        str2double(get(hObject,'String')) returns contents of pressure as a double


% --- Executes during object creation, after setting all properties.
function pressure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tau_Callback(hObject, eventdata, handles)
% hObject    handle to tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tau as text
%        str2double(get(hObject,'String')) returns contents of tau as a double


% --- Executes during object creation, after setting all properties.
function tau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function temperature_Callback(hObject, eventdata, handles)
% hObject    handle to temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temperature as text
%        str2double(get(hObject,'String')) returns contents of temperature as a double


% --- Executes during object creation, after setting all properties.
function temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function RightAscension_Callback(hObject, eventdata, handles)
% hObject    handle to RightAscension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RightAscension as text
%        str2double(get(hObject,'String')) returns contents of RightAscension as a double


% --- Executes during object creation, after setting all properties.
function RightAscension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RightAscension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Declination_Callback(hObject, eventdata, handles)
% hObject    handle to Declination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Declination as text
%        str2double(get(hObject,'String')) returns contents of Declination as a double


% --- Executes during object creation, after setting all properties.
function Declination_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Declination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function HourAngle_Callback(hObject, eventdata, handles)
% hObject    handle to HourAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of HourAngle as text
%        str2double(get(hObject,'String')) returns contents of HourAngle as a double


% --- Executes during object creation, after setting all properties.
function HourAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HourAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Zenith_Callback(hObject, eventdata, handles)
% hObject    handle to Zenith (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Zenith as text
%        str2double(get(hObject,'String')) returns contents of Zenith as a double


% --- Executes during object creation, after setting all properties.
function Zenith_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Zenith (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Azimuth_Callback(hObject, eventdata, handles)
% hObject    handle to Azimuth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Azimuth as text
%        str2double(get(hObject,'String')) returns contents of Azimuth as a double


% --- Executes during object creation, after setting all properties.
function Azimuth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Azimuth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function A1_Callback(hObject, eventdata, handles)
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function A2_Callback(hObject, eventdata, handles)
% hObject    handle to A2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function A3_Callback(hObject, eventdata, handles)
% hObject    handle to A3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function A5_Callback(hObject, eventdata, handles)
% hObject    handle to A5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%��ȡ���������ֵ
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
%��Ҫת��Ϊ����ֵ������������
h = h+min/60+sec/3600;              %��ȷʱ��
theta = lon*180/pi;                 %theta��ʾ���ȵĻ���
phi = lat*180/pi;                   %phi��ʾγ�ȵĻ���
omega = 0.017202786;                %omega���㷨���ģ���λ��day^(-1)
tau = 96.4+0.00158*(y-2060)*365;    %tau��ǰ���ò�ֵ���߼���ģ����������еĦ���
if(m<=2)                            %����ǰ�������������·�С��2����ô�·�+2�����-1
    m=m+12;
    y=y-1;
end
%�����㷨1�еĹ�ʽ����
%�������ģ�Ҳͨ����֤������û���⣬��ʽ��t�Ǿ���2060��������С��Ϊ-�����Ϊ+
t = fix(365.25*(y-2000))+fix(30.6001*(m+1))-fix(0.01*y)+d+h/24-21958;
%te���ǻ���TT�����ڵ���ת�������涼�����te������ȫ��̫��λ��
te = t+1.574*10^(-5)*tau;
%�㷨��һ��������s1=sin(omega*te),c1=cos(omega*te);
s1 = sin(omega*te);c1=cos(omega*te);
%�㷨�ڶ���������s2=2*s1*c1,c2=(c1+s1)*(c1-s1)
s2=2*s1*c1;c2=(c1+s1)*(c1-s1);
%�㷨������������ྭ��
alpha = -1.38880+1.72027920*10^(-2)*te+3.199*10^(-2)*s1...
        -2.65*10^(-3)*c1+4.050*10^(-2)*s2+1.525*10^(-2)*c2;
%�㷨���Ĳ����Ѧ�ת��������ķ�Χ:����mod(��,2��)
alpha = mod(alpha,2*pi);                                 %�����㷨�÷���ķ�Χ���棬��ʱ���ǻ���
alphaAngle = alpha*180/pi;                                %ת�����Ƕ�
set(handles.RightAscension,'string',num2str(alphaAngle)); %�����GUI
%�㷨���岽�������γ��
delta = 6.57*10^(-3)+7.347*10^(-2)*s1-3.9919*10^(-1)*c1...
        +7.3*10^(-4)*s2-6.60*10^(-3)*c2;
deltaAngle = delta*180/pi;
set(handles.Declination,'string',num2str(deltaAngle));
%�㷨��������ע�ⶼҪ�û���                              
H = 1.75283+6.3003881*t+theta-alpha;
%�㷨���߲�,ת������ķ�ΧH��mod(H+�У�2��)-��
H = mod(H+pi,2*pi)-pi;
HAngle = H*180/pi;                                        %ת�Ƕ����
set(handles.HourAngle,'string',num2str(HAngle));
%Final Step,�����㷨��һ����
%��������e0=arcsin(sin��sin��+cos��cos��cosH),���㶼Ҫ����
e0 = asin(sin(phi)*sin(delta)+cos(phi)*cos(delta)*cos(H));
%���㦤peӦ����������
deltape = -4.26*10^(-5)*cos(e0);                          %�Ե���Ϊ����
ep = e0+deltape;
%���㷽λ�Ǧ�=atan2(...)����
Gamma = atan2(sin(H),cos(H)*sin(phi)-tan(delta)*cos(phi));
GammaAngle = Gamma*180/pi;
set(handles.Azimuth,'string',num2str(GammaAngle));
deltare = 0.08422*pre/((273+tem)*tan(ep+(0.003138/(ep+0.08919))));
%�����춥��z
z = pi/2-ep-deltare;
zAngle = z*180/pi;
set(handles.Zenith,'string',num2str(zAngle));

% --- Executes during object deletion, before destroying properties.
function pushbutton1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup4.
function uibuttongroup4_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup4 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
