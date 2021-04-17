function varargout = GearSelectorGUI(varargin)
% GEARSELECTORGUI MATLAB code for GearSelectorGUI.fig
%      GEARSELECTORGUI, by itself, creates a new GEARSELECTORGUI or raises the existing
%      singleton*.
%
%      H = GEARSELECTORGUI returns the handle to a new GEARSELECTORGUI or the handle to
%      the existing singleton*.
%
%      GEARSELECTORGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEARSELECTORGUI.M with the given input arguments.
%
%      GEARSELECTORGUI('Property','Value',...) creates a new GEARSELECTORGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GearSelectorGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GearSelectorGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2013-2021 MathWorks, Inc.

% Edit the above text to modify the response to help GearSelectorGUI

% Last Modified by GUIDE v2.5 23-Dec-2011 08:04:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GearSelectorGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GearSelectorGUI_OutputFcn, ...
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


% --- Executes just before GearSelectorGUI is made visible.
function GearSelectorGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GearSelectorGUI (see VARARGIN)

% Choose default command line output for GearSelectorGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GearSelectorGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GearSelectorGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonMinus.
function pushbuttonMinus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonMinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CurrGearStr = get(handles.DisplayGearNum,'String');
%disp(CurrGearStr);
CurrGearNum = str2num(CurrGearStr);
NewGearNum = max(CurrGearNum-0.5,-1);
%disp(num2str(NewGearNum));
set(handles.DisplayGearNum,'String',num2str(NewGearNum));
set_param('GearSelect_Testrig/Signals/g','Value',num2str(NewGearNum));
set_param('GearSelect_Testrig/Signals/p','Value','0');
%set_param('GearSelect_Testrig/Signals/m','Value','1');


% --- Executes on button press in pushbuttonPlus.
function pushbuttonPlus_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPlus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CurrGearStr = get(handles.DisplayGearNum,'String');
%disp(CurrGearStr);
CurrGearNum = str2num(CurrGearStr);
NewGearNum = min(CurrGearNum+0.5,6);
set(handles.DisplayGearNum,'String',num2str(NewGearNum));
set_param('GearSelect_Testrig/Signals/g','Value',num2str(NewGearNum));
set_param('GearSelect_Testrig/Signals/p','Value','1');
%set_param('GearSelect_Testrig/Signals/m','Value','0');


function DisplayGearNum_Callback(hObject, eventdata, handles)
% hObject    handle to DisplayGearNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DisplayGearNum as text
%        str2double(get(hObject,'String')) returns contents of DisplayGearNum as a double


% --- Executes during object creation, after setting all properties.
function DisplayGearNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DisplayGearNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in StartSim.
function StartSim_Callback(hObject, eventdata, handles)
% hObject    handle to StartSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('GearSelect_Testrig', 'SimulationCommand', 'start');

% --- Executes on button press in StopSim.
function StopSim_Callback(hObject, eventdata, handles)
% hObject    handle to StopSim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('GearSelect_Testrig', 'SimulationCommand', 'stop');
