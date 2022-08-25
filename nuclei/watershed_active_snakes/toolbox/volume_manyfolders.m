%housekeeping commands
clearvars; close all; clc;
pxl = [0.267 0.267 0.3];
%folder containing the snake algorithms
addpath('.\BasicSnake');

% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\Gels\3T3\Dec2020\control';
% volume_stack_folder(fldr);

%% folder containing the data - stacks
% fldr = 'D:\data\Sandhya_PFTs_data\Control';
% volume_stack_folder(fldr);

fldr = 'D:\data\Sandhya_PFTs_data\A40';
volume_stack_folder(fldr);

fldr = 'D:\data\Sandhya_PFTs_data\B40';
volume_stack_folder(fldr);

fldr = 'D:\data\Sandhya_PFTs_data\A40_B40';
volume_stack_folder(fldr);
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\Gels\3T3\Dec2020\10kPa';
% volume_stack_folder(fldr);
% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\Gels\3T3\Dec2020\10kPa\Image17';
% volume_stack_folder(fldr);
% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\Gels\3T3\Dec2020\40kPa';
% volume_stack_folder(fldr);