function varargout = Application(varargin)
% APPLICATION MATLAB code for Application.fig
%      APPLICATION, by itself, creates a new APPLICATION or raises the existing
%      singleton*.
%
%      H = APPLICATION returns the handle to a new APPLICATION or the handle to
%      the existing singleton*.
%
%      APPLICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLICATION.M with the given input arguments.
%
%      APPLICATION('Property','Value',...) creates a new APPLICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Application_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Application_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Application

% Last Modified by GUIDE v2.5 30-Jul-2021 08:34:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Application_OpeningFcn, ...
                   'gui_OutputFcn',  @Application_OutputFcn, ...
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


% --- Executes just before Application is made visible.
function Application_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Application (see VARARGIN)

% Choose default command line output for Application
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Application wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Application_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I ;
global Ip;
I=imageimport();
Ip=I;
axes(handles.axes6)
imshow(I);
axes(handles.axes10)
imshow(Ip);
axes(handles.axes9)
imhist(I)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ip;
level = get(handles.slider1,'Value');
set(handles.text3, 'String', level);
axes(handles.axes10)
imshow(processChoice(contrast(brightness(Ip, get(handles.slider1,'Value')) ,get(handles.slider2,'Value')),get(handles.popupmenu2,'Value')));



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global Ip;
level = get(handles.slider2,'Value');
set(handles.text4, 'String', level);
axes(handles.axes10)
imshow(processChoice(contrast(brightness(Ip, get(handles.slider1,'Value')) ,get(handles.slider2,'Value')),get(handles.popupmenu2,'Value')));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global I;
global Ip;
Ip=I;
set(handles.slider1, 'value', 0);
set(handles.slider2, 'value', 0);
set(handles.text3, 'String', '0');
set(handles.text4, 'String', '0');
set(handles.edit1, 'String', '0');
set(handles.edit3, 'String', '0');
set(handles.edit1, 'String', '0');
set(handles.edit3, 'String', '255');
axes(handles.axes10)
imshow(Ip);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip;
s1=get(handles.slider1,'Value');
s2=get(handles.slider2,'Value');
Ip=contrast(brightness(Ip, s1) ,s2);
set(handles.slider1, 'value', 0);
set(handles.slider2, 'value', 0);
set(handles.text3, 'String', '0');
set(handles.text4, 'String', '0');


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global Ip;
axes(handles.axes10)
imshow(processChoice(contrast(brightness(Ip, get(handles.slider1,'Value')) ,get(handles.slider2,'Value')),get(handles.popupmenu2,'Value')));

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip;
s1=get(handles.slider1,'Value');
s2=get(handles.slider2,'Value');
pm=get(handles.popupmenu2,'Value');
if(s1~=0 || s2~=0)
    promptMessage = sprintf("L'application de seuillage soumettre implicitement les configuration que ous avez fais avant, voullez-vous continuer?");
    button = questdlg(promptMessage, 'Continue', 'Continue', 'Cancel', 'Continue');
    if strcmpi(button, 'Cancel')
      return; % Or break or continue
    end
    Ip=contrast(brightness(Ip, s1) ,s2);
end
Ip=processChoice(Ip,pm);
axes(handles.axes10)
imshow(Ip);
set(handles.slider1, 'value', 0);
set(handles.slider2, 'value', 0);
set(handles.text3, 'String', '0');
set(handles.text4, 'String', '0');
set(handles.edit1, 'String', '0');
set(handles.edit3, 'String', '255');
set(handles.popupmenu2, 'Value', 1);

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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip;
s1=get(handles.slider1,'Value');
s2=get(handles.slider2,'Value');
pm=get(handles.popupmenu2,'Value');
if(s1~=0 || s2~=0 || pm~=1)
    promptMessage = sprintf("L'application de seuillage soumettre implicitement les configuration que ous avez fais avant, voullez-vous continuer?");
    button = questdlg(promptMessage, 'Continue', 'Continue', 'Cancel', 'Continue');
    if strcmpi(button, 'Cancel')
      return; % Or break or continue
    end
    Ip=processChoice(contrast(brightness(Ip, s1) ,s2),pm);
    set(handles.slider1, 'value', 0);
    set(handles.slider2, 'value', 0);
    set(handles.text3, 'String', '0');
    set(handles.text4, 'String', '0');
    set(handles.popupmenu2, 'Value', 1);

end
Ip=seuillage(Ip,str2num(get(handles.edit1,'String')),str2num(get(handles.edit3,'String')));
axes(handles.axes10)
imshow(Ip);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip
figure()
imhist(processChoice(contrast(brightness(Ip, get(handles.slider1,'Value')) ,get(handles.slider2,'Value')),get(handles.popupmenu2,'Value')));


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip;
s1=get(handles.slider1,'Value');
s2=get(handles.slider2,'Value');
pm=get(handles.popupmenu2,'Value');
if(s1~=0 || s2~=0 || pm~=1)
    promptMessage = sprintf("L'application de seuillage soumettre implicitement les configuration que ous avez fais avant, voullez-vous continuer?");
    button = questdlg(promptMessage, 'Continue', 'Continue', 'Cancel', 'Continue');
    if strcmpi(button, 'Cancel')
      return; % Or break or continue
    end
    Ip=processChoice(contrast(brightness(Ip, s1) ,s2),pm);
    set(handles.slider1, 'value', 0);
    set(handles.slider2, 'value', 0);
    set(handles.text3, 'String', '0');
    set(handles.text4, 'String', '0');
    set(handles.popupmenu2, 'Value', 1);

end
axes(handles.axes10)
imshow(seuillage(Ip,str2num(get(handles.edit1,'String')),str2num(get(handles.edit3,'String'))));


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Ip;
s1=get(handles.slider1,'Value');
s2=get(handles.slider2,'Value');
pm=get(handles.popupmenu2,'Value');
if(s1~=0 || s2~=0 || pm~=1)
    promptMessage = sprintf("L'application de recherche soumit implicitement les configuration que ous avez fais avant, voullez-vous continuer?");
    button = questdlg(promptMessage, 'Continue', 'Continue', 'Cancel', 'Continue');
    if strcmpi(button, 'Cancel')
      return; % Or break or continue
    end
    Ip=processChoice(contrast(brightness(Ip, s1) ,s2),pm);
    set(handles.slider1, 'value', 0);
    set(handles.slider2, 'value', 0);
    set(handles.text3, 'String', '0');
    set(handles.text4, 'String', '0');
    set(handles.edit1, 'String', '0');
    set(handles.edit3, 'String', '255');
    set(handles.popupmenu2, 'Value', 1);

end
Ip=seuillage(Ip,str2num(get(handles.edit1,'String')),str2num(get(handles.edit3,'String')));
axes(handles.axes10)
imshow(Ip);
global query_image;
query_image=Ip;
[algonumber]=build_options(handles);
if algonumber==0
    msgbox('Vous devez choisir un algorime de recherche !!','Erreur','error');
else
    [similarityValues, euclideanDistances, fileNames]=do_fusion(handles,algonumber);
    global sv ;
    global ed ;
    global fn ;
    sv=similarityValues;
    ed=euclideanDistances;
    fn=fileNames;
    set(handles.listbox1,'string',fileNames);
    axes(handles.axes13)
    firstI=imread(fileNames{1});
    imshow(firstI);
    set(handles.text11,'String',strcat('Simularity : ',num2str(sv(1))));
    set(handles.text13,'String','Complete!!');
    drawnow;
end
function [algonumber]=build_options(handles)
    algonumber=0;
        if get(handles.checkbox1, 'Value')
            algonumber=algonumber+1;
        end
        if  get(handles.checkbox5, 'Value') 
           algonumber=algonumber+1;
        end
        if  get(handles.checkbox4, 'Value')
            algonumber=algonumber+1;
        end
        if  get(handles.checkbox2, 'Value')
            algonumber=algonumber+1;
        end
        if  get(handles.checkbox3, 'Value')
            algonumber=algonumber+1;
        end
        


function [similarityValues, euclideanDistances, fileNames]=do_fusion(handles,algonumber)
set(handles.text13,'String','Cherche...');
drawnow;
gamma = 1;
psi = 0.1;
theta = 90;
bw = 2.8;
lambda = 3.5; 
pi = 180;
NumberOfBins=256;
s=1;
% Number of files found
try 
    load('images.mat');
catch ME
    set(handles.text13,'String',"Les données n'existent pas" );
    drawnow;
    loaddata(handles);
    load('images.mat');
end
numberOfFiles=length(data.fileNames);
euclideanDistances = zeros( numberOfFiles, algonumber);
similarityValues = zeros(numberOfFiles, algonumber);
fileNames = {};
global query_image;
colorHsvQuery=colorhist(query_image,'hsv', NumberOfBins );
colorRgbQuery=colorhist(query_image,'rgb', NumberOfBins );
edgeFeatQuery=edgeFeat(query_image,0.1);
txtFeatQuery=textureFeat(query_image)';
gabMeanQuery=GaborMean(query_image, gamma, psi, theta, bw, lambda, pi);
gabStdQuery=GaborStd(query_image, gamma, psi, theta, bw, lambda, pi);


for ii=1:numberOfFiles
        % get current file name, read current image
        s=1;
        if get(handles.checkbox1, 'Value')
            if get(handles.radiobutton5, 'Value')
                colorRgbDist = euclideanDistance(colorRgbQuery, data.rgbColor(ii,:));
                euclideanDistances(ii, s) = colorRgbDist;
                s=s+1;
            else
                colorHsvDist = euclideanDistance(colorHsvQuery, data.hsvColor(ii,:));
                euclideanDistances(ii, s) = colorHsvDist;
                s=s+1;
            end
        end
        if  get(handles.checkbox5, 'Value') 
           edgeFeatDist = euclideanDistance(edgeFeatQuery, data.edgFeat(ii,:));
           euclideanDistances(ii, s) = edgeFeatDist;
           s=s+1;
        end
        if  get(handles.checkbox4, 'Value')
           txtFeatDist = euclideanDistance(txtFeatQuery, data.txtFeat(ii,:)');
           euclideanDistances(ii, s) = txtFeatDist;
           s=s+1;
        end
        if  get(handles.checkbox2, 'Value')
           gabMeanDist = euclideanDistance(gabMeanQuery, data.meanGab(ii,:));
           euclideanDistances(ii, s) = gabMeanDist;
           s=s+1;
        end
        if  get(handles.checkbox3, 'Value')
           gabStdDist = euclideanDistance(gabStdQuery, data.stdGab(ii,:));
           euclideanDistances(ii, s) = gabStdDist;
        end
end
if s>1
  euclideanDistances=mean(euclideanDistances,2);
end
[euclideanDistances, sortedIndexes] = sortrows(euclideanDistances);
len = length(euclideanDistances);
newFileNames = {};
for ii = 1:len
    newFileNames = [newFileNames; data.fileNames(sortedIndexes(ii,1),1)];
end
if(length(newFileNames)>10)
fileNames = newFileNames(1:10);
else
fileNames = newFileNames;
end
maxDist = euclideanDistances(length(euclideanDistances));
% Computing similarity values for first filter pass
len = length(euclideanDistances);
for ii = 1:len
    eDist = euclideanDistances(ii);
    result = 1 - (eDist/maxDist);
    similarityValues(ii) = result;
end

% load database



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
i=get(handles.listbox1,'value');
list=get(handles.listbox1,'String');
axes(handles.axes13)
imshow(imread(list{i}));
global sv;
set(handles.text11,'String',strcat('similarité : ',num2str(sv(i))));

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
set(handles.radiobutton5,'value',0);
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
set(handles.radiobutton4,'value',0);
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder = uigetdir();
disp(folder);
oldFolder = cd(folder);             % change dir to dirName
imagefiles = dir('*.jpg');           % get image file names in this folder
cd(oldFolder)                        % change dir back to root folder
numberOfFiles = length(imagefiles);  % Number of files found
data.rgbColor = zeros(numberOfFiles,256);
data.hsvColor = zeros(numberOfFiles,256);
data.meanGab = zeros(numberOfFiles,480);
data.stdGab = zeros(numberOfFiles,480);
data.txtFeat = zeros(numberOfFiles,4);
data.edgFeat = zeros(numberOfFiles,150);
data.fileNames = {};
gamma = 1;
psi = 0.1;
theta = 90;
bw = 2.8;
lambda = 3.5; 
pi = 180;
NumberOfBins=256;
resolution = [540; 540];
set(handles.text13,'String',strcat('(',num2str(0),' / ' ,num2str(numberOfFiles), ')') );
for ii=1:numberOfFiles
        set(handles.text13,'String',strcat('(',num2str(ii),' / ' ,num2str(numberOfFiles), ')') );
        % get current file name, read current image
        currentfilename =  join([folder,'/',imagefiles(ii).name]);
        drawnow;
        currentimage = imread(currentfilename);
       
        % update file names row
        data.fileNames = [data.fileNames; currentfilename];

        % resizing curr image to a standard resolution
        currentimage = imresize(currentimage,[resolution(1,:) resolution(2,:)]);
        [rows, cols, numOfBands] = size(currentimage);
        if numOfBands == 1
            %cmap = colormap(gray);
            disp(numOfBands);
            currentimage = grs2rgb(currentimage);
        end 
        currentHistRgb=colorhist(currentimage,'rgb', NumberOfBins );
        currentHistHsv=colorhist(currentimage,'hsv', NumberOfBins );
        currentEdgeFeat=edgeFeat(currentimage,0.1);
        currentTxtFeat=textureFeat(currentimage);
        currentGabMean=GaborMean(currentimage, gamma, psi, theta, bw, lambda, pi);
        currentGabStd=GaborStd(currentimage, gamma, psi, theta, bw, lambda, pi);
        data.rgbColor(ii,:) = currentHistRgb;
        data.hsvColor(ii,:) = currentHistHsv;
        data.edgFeat(ii,:) = currentEdgeFeat;
        data.txtFeat(ii,:) = currentTxtFeat;
        data.meanGab(ii,:) = currentGabMean;
        data.stdGab(ii,:) = currentGabStd;
end
set(handles.text13,'String','Fini');
if ~get(handles.checkbox7, 'Value')
    ndata=data;
    try
    load('images.mat');
    data.rgbColor=[data.fileNames;ndata.fileNames];
    data.rgbColor=[data.rgbColor;ndata.rgbColor];
    data.hsvColor = [data.hsvColor;ndata.hsvColor];
    data.edgFeat = [data.edgFeat;ndata.edgFeat];
    data.txtFeat= [data.txtFeat;ndata.txtFeat];
    data.meanGab = [data.meanGab;ndata.meanGab];
    data.stdGab= [data.stdGab;ndata.stdGab];
    catch Me
        disp('Error');
    end
end
save('images.mat','data');
% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
