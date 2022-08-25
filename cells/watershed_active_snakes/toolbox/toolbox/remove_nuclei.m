function varargout = remove_nuclei(varargin)
% REMOVE_NUCLEI MATLAB code for remove_nuclei.fig
%      REMOVE_NUCLEI, by itself, creates a new REMOVE_NUCLEI or raises the existing
%      singleton*.
%
%      H = REMOVE_NUCLEI returns the handle to a new REMOVE_NUCLEI or the handle to
%      the existing singleton*.
%
%      REMOVE_NUCLEI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REMOVE_NUCLEI.M with the given input arguments.
%
%      REMOVE_NUCLEI('Property','Value',...) creates a new REMOVE_NUCLEI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before remove_nuclei_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to remove_nuclei_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help remove_nuclei

% Last Modified by GUIDE v2.5 07-Jun-2019 17:23:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @remove_nuclei_OpeningFcn, ...
                   'gui_OutputFcn',  @remove_nuclei_OutputFcn, ...
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
end

% --- Executes just before remove_nuclei is made visible.
function remove_nuclei_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to remove_nuclei (see VARARGIN)

% Choose default command line output for remove_nuclei
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
cla;
set(handles.txtout,'String','');

% UIWAIT makes remove_nuclei wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = remove_nuclei_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in fldr.
function fldr_Callback(hObject, eventdata, handles)
% hObject    handle to fldr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fldrnme = uigetdir('E:\data\Channel');
set(handles.fnmetxt,'String',fldrnme);
end


function day_Callback(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day as text
%        str2double(get(hObject,'String')) returns contents of day as a double
end
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
end

function liffnme_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function n_imgs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function typ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function cellcnt_Callback(hObject, eventdata, handles)
% hObject    handle to cellcnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cellcnt as text
%        str2double(get(hObject,'String')) returns contents of cellcnt as a double
end

% --- Executes during object creation, after setting all properties.
function cellcnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cellcnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on mouse press over axes background.
function imgButtonDownFcn(hObject, eventdata)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% cntrds = handles.cells;

hndls = guidata(hObject);
nwcntrd = get(hndls.axes1,'CurrentPoint');
nwpt = nwcntrd(1,1:2);

chldrn = get(hndls.axes1,'children');
lnehndle = chldrn(strcmp(get(chldrn,'type'),'line'));
cellsx = get(lnehndle,'xdata'); cellsy = get(lnehndle,'ydata');

% cntrds = cat(1,hndls.cells)


clck = get(gcbf,'SelectionType');

if strcmp(clck,'normal')
    cellsx(end+1)=nwpt(1); cellsy(end+1)=nwpt(2);
  
else
    [~,indx] = min((cellsx-nwpt(1)).^2 + (cellsy-nwpt(2)).^2);
    cellsx(indx)=[]; cellsy(indx)=[];
    
end

delete(lnehndle);
hndle=plot(cellsx,cellsy,'wx','markersize',3);
% set(hndle,'hittest','off');
set(hndls.cellcnt,'String',num2str(length(cellsx)));
hndls.cells = [cellsx cellsy];
guidata(hObject,hndls);
% fprintf('Mouse pressed at %f, %f\n',nwcell(1,1),nwcell(1,2));
% fprintf('%s\n',get(gcbf,'SelectionType'));
end

function typ_Callback(hObject, eventdata, handles)
% hObject    handle to typ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of typ as text
%        str2double(get(hObject,'String')) returns contents of typ as a double
end


function n_imgs_Callback(hObject, eventdata, handles)
% hObject    handle to n_imgs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_imgs as text
%        str2double(get(hObject,'String')) returns contents of n_imgs as a double
end


function imgnum_Callback(hObject, eventdata, handles)
% hObject    handle to imgnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imgnum as text
%        str2double(get(hObject,'String')) returns contents of imgnum as a double
end

% --- Executes during object creation, after setting all properties.
function imgnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imgnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function liffnme_Callback(hObject, eventdata, handles)
% hObject    handle to liffnme (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of liffnme as text
%        str2double(get(hObject,'String')) returns contents of liffnme as a double
end


% --- Executes during object creation, after setting all properties.
function txtout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% set(handles.txtout,'String','');
set(hObject,'String','');
end


% --- Executes on button press in delpts.
function delpts_Callback(hObject, eventdata, handles)
% hObject    handle to delpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hndls = guidata(hObject);

chldrn = get(hndls.axes1,'children');
lnehndle = chldrn(strcmp(get(chldrn,'type'),'line'));
delete(lnehndle);

% hndle=plot(cellsx,cellsy,'wx','markersize',3);
% set(hndle,'hittest','off');
set(hndls.cellcnt,'String',num2str(0));
hndls.cells = zeros(0,2);
guidata(hObject,hndls);

end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over delpts.
function delpts_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to delpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hndls = guidata(hObject);

chldrn = get(hndls.axes1,'children');
lnehndle = chldrn(strcmp(get(chldrn,'type'),'line'));
delete(lnehndle);

% hndle=plot(cellsx,cellsy,'wx','markersize',3);
% set(hndle,'hittest','off');
set(hndls.cellcnt,'String',num2str(0));
hndls.cells = zeros(0,2);
guidata(hObject,hndls);

end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fldr = get(handles.fnmetxt,'String');
prfx = get(handles.liffnme,'String');
imgfnme = [fldr '\' prfx '.tif'];
matfnme = [fldr '\' prfx '.mat'];

img=imread(imgfnme); 

if length(size(img))==3
    img=img(:,:,1:3); 
    gry = rgb2gray(img);
else
    gry = img;
end
    
load(matfnme);

% enhnc = adapthisteq(gry,'cliplimit',0.02,'distribution','rayleigh');
enhnc = gry;

axes(handles.axes1); cla; hold on;
imshow(enhnc); axis tight;
% axes(handles.axes1); cla; hold on;
% imshow(gry,'border','tight'); axis tight;

axes(handles.axes2); cla; hold on;
himg=imshow(enhnc); axis tight;
% axes(handles.axes2); cla; hold on;
% himg=imshow(gry,'border','tight'); axis tight;
set(himg,'ButtonDownFcn',@imgButtonDownFcn1);

for ncls=1:length(dat)
    if dat(ncls).include==true
        O=dat(ncls).boundary;
        axes(handles.axes2);
        plot(O(:,2),O(:,1),'r-');
    end
end

end

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton5.
function pushbutton5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on mouse press over axes background.
function imgButtonDownFcn1(hObject, eventdata)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

nwcntrd = get(handles.axes2,'CurrentPoint');
nwpt = nwcntrd(1,1:2);

clck = get(gcbf,'SelectionType');

fldr = get(handles.fnmetxt,'String');
prfx = get(handles.liffnme,'String');

matfnme = [fldr '\' prfx '.mat'];
load(matfnme);

cntrds=zeros(length(dat),2);

for ncls=1:length(dat)
    if dat(ncls).include==true
        O=dat(ncls).boundary;
        cntrds(ncls,:)=mean(O,1);
    end
end

d = sqrt((cntrds(:,1)-nwpt(2)).^2+(cntrds(:,2)-nwpt(1)).^2);
[~,id]=min(d);
axes(handles.axes2); hold on;
if strcmp(clck,'normal')
    plot(cntrds(id,2),cntrds(id,1),'rx','markersize',12);
    dat(id).include=false;
else
    plot(cntrds(id,2),cntrds(id,1),'bx','markersize',12);    
    dat(id).include=true;
end

drawnow;

save(matfnme,'dat');

end
