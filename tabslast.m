function varargout = tabslast(varargin)
% TABSLAST M-file for tabslast.fig
%      TABSLAST, by itself, creates a new TABSLAST or raises the existing
%      singleton*.
%
%      H = TABSLAST returns the handle to a new TABSLAST or the handle to
%      the existing singleton*.
%
%      TABSLAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABSLAST.M with the given input arguments.
%
%      TABSLAST('Property','Value',...) creates a new TABSLAST or raises the

%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tabslast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tabslast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tabslast

% Last Modified by GUIDE v2.5 22-Jun-2014 23:33:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tabslast_OpeningFcn, ...
                   'gui_OutputFcn',  @tabslast_OutputFcn, ...
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


% --- Executes just before tabslast is made visible.
function tabslast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tabslast (see VARARGIN)

% Choose default command line output for tabslast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tabslast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tabslast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
