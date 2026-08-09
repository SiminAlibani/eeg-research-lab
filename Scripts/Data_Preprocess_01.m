%%  Concatenate Consequtive Files 
% File name has changed from s1_cleaner to Data_Preprocess_01.m
% (1) Concatenate all sessions  ---> 
% (2) Removing the References , Selecting the EEG Channels  --->
% (3) Extracting the onset Trials. 
% Extract 126 EEG Channels from all sessions as data.mat
% Extract onset events from trigger and TRL_Success as events.mat

% The code is executed on EEG Data Folder containing (22 Subjects): 
% sub02-t1, sub03-t1, sub04-t1, sub05-t1, sub08-t1, sub09-t1, sub10-t1,
% sub11-t1, sub13-t1, sub14-t1, sub15-t1, sub18-t1, sub19-t1, sub20-t1, 
% sub21-t1, sub22-t1, sub23-t1, sub24-t1, sub25-t1, sub26-t1, sub28-t1, sub29-t1

% Subjects with full Trials (155 events and 10 iteration for each = 1550 or 1549) are (15 Subjects): 
% sub08-t1, sub09-t1, sub10-t1, sub11-t1, sub14-t1, sub15-t1, sub18-t1,
% sub19-t1, sub20-t1, sub21-t1, sub24-t1, sub25-t1, sub26-t1, sub28-t1, sub29-t1

% Subjects with imperfect Trials are (4 Subjects):
% sub05-t1, sub13-t1, sub22-t1, sub23-t1


% Subjects with empty nevent are (3 Subjects):
% sub02-t1, sub03-t1, sub04-t1

% No Subject Folder with name : 
% sub01-t1, sub06-t1, sub07-t1, sub12-t1, sub16-t1, sub17-t1, sub27-t1,


%% Read Files
close all; clear; clc;
path = uigetdir();
files = string(ls(fullfile(path, '*_00*.mat')));

%% Concatenate files
nfile = length(files);
data = [];
for ifile = 1:nfile
    d = load(fullfile(path, files(ifile)));
    d = squeeze(d.data);
    data = [data, d]; %#ok<AGROW>
end


%% Extracting and seperating the event and the data file.
trig = data(130, :);   % Trigger Signal.
data = data(2:129, :); % EEG Channels.
data([63, 64], :) = [];% Remove the Reference channels A1 & A2.

% load(fullfile(path, ls(fullfile(path, '*TaskData.mat'))), 'trials')

%% Selecting onset events.
FIX_START   = 220;
FIX_BREAK   = 221;
STM_OFFSET  = 222;
TRL_SUCCESS = 223;
TRL_FAILURE = 224;
SESSION_START = 225;

fs = 1200; % Sampling Frequency
redges = [0, diff(trig)];
redges(redges < 0) = 0;

events = find((redges < 200) & (redges > 0));
nevent = length(events);

onsets = [];
for ievent = 1:nevent
    timew = events(ievent):(events(ievent) + 1300 * fs / 1000);
    if (timew(end) > size(data, 2)), continue, end
    trigw = redges(timew);
    trigw = trigw(trigw > 0);
    if ismember(TRL_SUCCESS, trigw)
        onsets = [onsets, events(ievent)]; 
    end
end

% assert(sum(~isnan([trials.onset])) == length(onsets))
nonset = length(onsets);

%% Save The events and data
save(fullfile(path, 'data.mat'), 'data', '-v7.3')
events = [onsets; redges(onsets)]'; % events with two columns : latency and type
save(fullfile(path, 'events.mat'), 'events')
