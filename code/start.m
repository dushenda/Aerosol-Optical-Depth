function varargout = start(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @start_OpeningFcn, ...
                   'gui_OutputFcn',  @start_OutputFcn, ...
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


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
global choose;
warning('off','all');
% Choose default command line output for start
handles.output = hObject;
clc;
h = handles.figure1; %��������
icon='../img/logo.jpg';
newIcon = javax.swing.ImageIcon(icon);
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
%���ñ���
AxesBg=axes('units','pixels','pos',[0 0 960 540]); % ��������ͼ���axes
uistack(AxesBg,'down');                             % ���ڵײ�
axes(AxesBg);
ImageBg='../img/background.jpg';
imshow(ImageBg);                                    %��ʾͼ��
set(AxesBg,'visible','off');                        %axe��򲻿ɼ�
alpha(AxesBg,.85);
hold on
% T=text(600,700,'��ӭʹ�ñ�ϵͳ��','fontsize',20,'color','b')
text(389,425,'��ѡ��һ���㷨','fontsize',16,'color','w');
hold on
text(1400,900,'˵��:','fontsize',14,'color','w');
hold on
text(1400,940,'1.�㷨1~5�ľ���һֱ�����','fontsize',14,'color','w');
guidata(hObject, handles);

% UIWAIT makes start wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in A1.
function A1_Callback(hObject, eventdata, handles)
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global choosetype;
global choose;
global data;
global addEW;
global signNS;
choose=1;
if choosetype==1    %ѡ�����ļ�ģʽ
chooseArea('Visible','on');
Al1(data,addEW,signNS);
else                %Ĭ������������
    set(gcf,'Visible','off');
    A1('Visible','on');
end


% Update handles structure
    
    
% --- Executes on button press in A2.
function A2_Callback(hObject, eventdata, handles)
% hObject    handle to A2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global choosetype;
global choose;
global data;
global addEW;
global signNS;
choose=2;
if choosetype==1    %ѡ�����ļ�ģʽ
chooseArea('Visible','on');
Al2(data,addEW,signNS);
else                %Ĭ������������
    set(gcf,'Visible','off');
    A1('Visible','on');
end

% --- Executes on button press in A3.
function A3_Callback(hObject, eventdata, handles)
% hObject    handle to A3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global choosetype;
global choose;
global data;
global addEW;
global signNS;
choose=3;
if choosetype==1    %ѡ�����ļ�ģʽ
chooseArea('Visible','on');
Al3(data,addEW,signNS);
else                %Ĭ������������
    set(gcf,'Visible','off');
    A1('Visible','on');
end

% --- Executes on button press in A4.
function A4_Callback(hObject, eventdata, handles)
% hObject    handle to A4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global choosetype;
global choose;
global data;
global addEW;
global signNS;
choose=4;
if choosetype==1    %ѡ�����ļ�ģʽ
chooseArea('Visible','on');
Al4(data,addEW,signNS);
else                %Ĭ������������
    set(gcf,'Visible','off');
    A1('Visible','on');
end

% --- Executes on button press in A5.
function A5_Callback(hObject, eventdata, handles)
% hObject    handle to A5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global choosetype;
global choose;
global data;
global addEW;
global signNS;
choose=5;
if choosetype==1    %ѡ�����ļ�ģʽ
chooseArea('Visible','on');
Al5(data,addEW,signNS);
else                %Ĭ������������
    set(gcf,'Visible','off');
    A1('Visible','on');
end

% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function A1_CreateFcn(hObject, eventdata, handles)
h1=handles.A1;
h1.Background="black";
% hObject    handle to A1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
