%housekeeping commands
clearvars; close all; 
%initialising variables
ar3 = zeros(0,1); vol = zeros(0,1); ecc = zeros(0,1); srfar = zeros(0,1);
%folder containing the data
fldr = 'D:\GoogleDrive\nuclear_shape_modelling\inverse_modelling\TwoParameter\Reshma_data\Series007';
%output file which will have the areas, volume and eccentricity of nuclei
ofnme = [fldr '\areas_vol.mat'];

%reading the readme file
rnme = [fldr '\readme.txt'];
rd = textread(rnme,'%s','delimiter','\n'); cnt=1;

for npat = 1:length(rd)/3
    %processing the readme file
    fnmepat = rd{3*npat-2};
    matpat = rd{3*npat-1};
    eval(['fnmes =' fnmepat ';']);

    for nf=1:length(fnmes)
        %reading and loading individual .mat files
        fnme = sprintf(matpat,fnmes(nf));
        load([fldr '\' fnme '.mat']);
        %looping over individual nuclei
        for ndat=1:length(dat)
            %checking if the nucleus has been excluded
            if dat(ndat).include
                %reading the voxel size
                xypxl = dat(ndat).pxl(1); zpxl=dat(ndat).pxl(3);
                %reading the 3D nuclear surface
                OV = dat(ndat).surf;
                %scaling the surface according to the voxel size
                OV.vertices = OV.vertices*diag([xypxl,xypxl,zpxl]);
                %projecting the surface for the projected area and
                %eccentricity
                pts = OV.vertices(unique(OV.faces),:);
                ptsprj = pts(:,1:2);
                fcs = delaunay(ptsprj); n_fcs=size(fcs,1);
                %projected area
                area3 = sum(abs(polyarea(reshape(pts(fcs',1),[3 n_fcs]),reshape(pts(fcs',2),[3 n_fcs]))));
                [vol3, srfar3]=stlVolume(OV.vertices',OV.faces'); 
                ar3 = [ar3; area3]; %projected area
                vol = [vol; vol3];  %volume
                srfar = [srfar; srfar3]; %surface area
                dat(ndat).PA=area3; dat(ndat).SA=srfar3; dat(ndat).V=vol3;
            end
        end
        save([fldr '\' fnme '.mat'],'dat');
    end
end

%printing the mean values to the command window
[mean(ar3) mean(vol) mean(srfar)]
save(ofnme,'ar3','vol','srfar');