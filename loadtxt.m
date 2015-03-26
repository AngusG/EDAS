function channels = loadtxt(segment, type)


%% file 2 of 3: loadtxt.m

% Author: Angus Galloway, March 2015

% purpose: load interictal eeg data as channels done in separate script to save time when testing new features
% Assumes: ipmat.py has been run and interictal.txt available

%clear all; close all; clc;

if(strcmp(type,'i'))
  path = 'data/interictal';  
  
elseif(strcmp(type,'p'))
  path = 'data/preictal';
  
elseif(strcmp(type,'t'))
  path = 'data/test'; 
 
else 
  print ('Usage error: must specify i,p or t'); 
end  
 

file = strcat(path,segment);
fileName = strcat(file, '.txt')

channels = load(fileName); %save as generic channels

[m, n] = size(channels);