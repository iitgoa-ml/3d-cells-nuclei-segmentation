clearvars; close all; clc;

%folder containing the snake algorithms
addpath('.\BasicSnake');
%folder containing data
fldr = '.\lsm';
%getting the list of .lsm files
lst = dir([fldr '\*.lsm']);

%looping through all the lsm files
for nfnme = 1:length(lst)
    %getting the name of the next lsm file
    fnme = [fldr '\' lst(nfnme).name];
    %name of the output mat file
    ofnme = [fnme(1:end-3) 'mat'];
    %name of the maximum projected image file
    ifnme = [fnme(1:end-3) 'tif'];
    %reading the lsm file
    lsm = lsmread(fnme);
    %reading the information
    info = lsmread(fnme,'infoonly');
    %getting the voxel size and converting to um
    xypxl = info.voxSizeX; xypxl=xypxl*1e6;
    zpxl = info.voxSizeZ;  zpxl=zpxl*1e6;
    %reading the nuclear information. In this case its the second channel
    dat = squeeze(lsm(1,2,:,:,:)); 
    [szez,szex,szey]=size(dat); 
    %converting the data into a 3-d image file
    img = reshape(reshape(dat(:),[szez szex*szey])',[szex szey szez]);
    %calculating the maximum projection
    mx = max(img,[],3);
    %running the 2D algorithm on the maximum projection
    dat = algo_snakes_noadj(mx,xypxl,false);
    %saving the pixel size for each nucleus
    for ndat=1:length(dat)
        dat(ndat).pxl = [xypxl xypxl zpxl];
    end
    %saving the mat file containing the nucleus data
    save(ofnme,'dat');
    %writing the maximum projection image file
    imwrite(mx,ifnme);
    close all;
end

