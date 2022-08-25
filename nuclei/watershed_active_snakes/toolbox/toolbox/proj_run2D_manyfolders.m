%housekeeping commands
clearvars; close all; clc;

%folder containing the snake algorithms
addpath('.\BasicSnake');
%size of one voxel in um
pxl=[0.267 0.267 0.3]; 


%% folder containing the data - stacks
fldr = 'D:\data\Sandhya_PFTs_data\control';
read_stack_proj_run2D(fldr,pxl)

% %% folder containing the data - stacks
fldr = 'D:\data\Sandhya_PFTs_data\B40';
read_stack_proj_run2D(fldr,pxl)
% 
% %% folder containing the data - stacks
fldr = 'D:\data\Sandhya_PFTs_data\A40_B40';
read_stack_proj_run2D(fldr,pxl)

% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\MDAMB\Jul19\Noco\T2';
% read_stack_proj_run2D(fldr,pxl)
% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\MDAMB\Jul19\Noco\T3';
% read_stack_proj_run2D(fldr,pxl)
% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\3T3\Jul19\Noco\T2';
% read_stack_proj_run2D(fldr,pxl)
% 
% %% folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\3T3\Jul19\Noco\T3';
% read_stack_proj_run2D(fldr,pxl)