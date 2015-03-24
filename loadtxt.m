%% file 2 of 3: loadtxt.m

% Author: Angus Galloway, March 2015

% purpose: loadig of eeg data as channels done in separate script to save time when testing new features
% Assumes: pmat.py has been run and pmat.txt available

%clear all; close all; clc;

channels = load('data/pmat.txt'); %x = load('ex4Data/ex4x.dat'); 
y = load('ex4Data/ex4y.dat');

[m, n] = size(channels)