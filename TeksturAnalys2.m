function varargout = TeksturAnalys2(varargin)
% TEKSTURANALYS2 MATLAB code for TeksturAnalys2.fig
%      TEKSTURANALYS2, by itself, creates a new TEKSTURANALYS2 or raises the existing
%      singleton*.
%
%      H = TEKSTURANALYS2 returns the handle to a new TEKSTURANALYS2 or the handle to
%      the existing singleton*.
%
%      TEKSTURANALYS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEKSTURANALYS2.M with the given input arguments.
%
%      TEKSTURANALYS2('Property','Value',...) creates a new TEKSTURANALYS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TeksturAnalys2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TeksturAnalys2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TeksturAnalys2

% Last Modified by GUIDE v2.5 28-May-2022 08:47:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TeksturAnalys2_OpeningFcn, ...
                   'gui_OutputFcn',  @TeksturAnalys2_OutputFcn, ...
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


% --- Executes just before TeksturAnalys2 is made visible.
function TeksturAnalys2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TeksturAnalys2 (see VARARGIN)

% Choose default command line output for TeksturAnalys2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject,'center');
% UIWAIT makes TeksturAnalys2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TeksturAnalys2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Menu Browse image
[nama_file,nama_folder] = uigetfile('*.*');

%File yang dipilih akan di jalankan oleh perintah dibawah
if ~isequal(nama_file,0)
    %script membaca file citra RGB
    Img = imread(fullfile(nama_folder,nama_file));
    %akan menampilkan citra RGB pada axes
    axes(handles.axes1)
    imshow(Img)
    title('RGB Image')
    %berguna menyimpan variable img pada lokasi handle yang akan dipanggil
    %oleh pushbutton
    handles.Img = Img;
    guidata(hObject,handles)
else
    %jika tidak ada maka file yang dipilih maka akan dipanggil
return
end

    

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%memanggil variable IMG di handles
Img = handles.Img;
%mengkonversi RGB ke grayscale
Img_gray = rgb2gray(Img);
%berguna menampilkan grascale pada axes
axes(handles.axes3)
imshow(Img_gray)
title('Grayscale Image')
%berguna untuk membaca pixel distance pada edit text
pixel_dist = str2double(get(handles.edit1,'String'));
%membentuk matriks kookurensi
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist;...
       -pixel_dist pixel_dist;-pixel_dist 0; -pixel_dist -pixel_dist]);
%mengekstrak fitur GLCM
stats = graycoprops (GLCM,{'Contrast','Correlation','Energy','Homogeneity'});
%membaca fitur GLCM
Contrast = stats.Contrast;
Correlation = stats.Contrast;
Energy = stats.Energy;
Homogeneity = stats.Homogeneity;
%menampilakn fitur GLCM pada tabel
data = get(handles.uitable1,'Data');
data{1,1} = num2str(Contrast(1));
data{1,2} = num2str(Contrast(2));
data{1,3} = num2str(Contrast(3));
data{1,4} = num2str(Contrast(4));
data{1,5} = num2str(mean(Contrast));

data{2,1} = num2str(Correlation(1));
data{2,2} = num2str(Correlation(2));
data{2,3} = num2str(Correlation(3));
data{2,4} = num2str(Correlation(4));
data{2,5} = num2str(mean(Correlation));

data{3,1} = num2str(Energy(1));
data{3,2} = num2str(Energy(2));
data{3,3} = num2str(Energy(3));
data{3,4} = num2str(Energy(4));
data{3,5} = num2str(mean(Energy));

data{4,1} = num2str(Homogeneity(1));
data{4,2} = num2str(Homogeneity(2));
data{4,3} = num2str(Homogeneity(3));
data{4,4} = num2str(Homogeneity(4));
data{4,5} = num2str(mean(Homogeneity));

set(handles.uitable1,'Data',data)

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%berguna untuk membersihkan axes
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

set(handles.uitable1,'Data',[])
set(handles.edit1,'String','1')

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
