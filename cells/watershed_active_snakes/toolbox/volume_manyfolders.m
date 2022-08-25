%housekeeping commands
clearvars; close all; clc;

%folder containing the snake algorithms
addpath('.\BasicSnake');

%folder containing the data - lsm
% fldr = '.\lsm';
% volume_lsm_folder(fldr);

%folder containing the data - stacks
fldr = 'D:\GoogleDrive\nuclear_shape_modelling\inverse_modelling\TwoParameter\Reshma_data\Series007';
volume_stack_folder(fldr);

% %folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\MCF7_control_Noco_Cyto\Noco';
% volume_stack_folder(fldr);
% 
% %folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\MCF7_control_Noco_Cyto\Cyto_0.9uL';
% volume_stack_folder(fldr);
% 
% %folder containing the data - stacks
% fldr = 'D:\data\predicting_traction\MCF7_control_Noco_Cyto\Cyto_1.8uL';
% volume_stack_folder(fldr);