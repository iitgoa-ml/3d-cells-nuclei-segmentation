%housekeeping commands
clearvars; close all; clc;

%folder containing the snake algorithms
addpath('.\BasicSnake');
%folder containing data
fldr = 'D:\GoogleDrive\nuclear_shape_modelling\inverse_modelling\TwoParameter\Reshma_data\Series007';

%size of one voxel in um
pxl=[0.2405 0.2405 0.5]; 

%reading the readme file
rnme = [fldr '\readme.txt'];
rd = textread(rnme,'%s','delimiter','\n');
    
for npat = 1:length(rd)/3
    %processing the readme file
    fnmepat = rd{3*npat-2};
    matpat = rd{3*npat-1};
    imgpat  = rd{3*npat};
    eval(['fnmes =' fnmepat ';']);

    %looping through each image stack
    for nf=1:length(fnmes)
        bnme = sprintf(matpat,fnmes(nf));
        imgsnme = sprintf(imgpat,fnmes(nf));
        %file name pattern for each file in the stack
        lst = dir([fldr '\' imgsnme]); szez = length(lst);
        %building the stack
        for nimgs=1:szez
            tmp = imread([fldr '\' lst(nimgs).name]);
            if length(size(tmp))==3
                zimg = rgb2gray(tmp);
            else
                zimg = tmp;
            end
            img(:,:,nimgs) = zimg;
        end
        %calculating the maximum projection
        imgz = im2uint8(max(img,[],3));
        %running the 2D algorithm on the maximum projection
        dat = algo_snakes_noadj(imgz,pxl(1),false);
        %saving the pixel size for each nucleus
        for ndat=1:length(dat)
            dat(ndat).pxl = pxl;
        end
        %saving the mat file containing the nucleus data
        save([fldr '\' bnme '.mat'],'dat');
        %writing the maximum projection image file
        imwrite(imgz,[fldr '\' bnme '.tif']);
    end
end