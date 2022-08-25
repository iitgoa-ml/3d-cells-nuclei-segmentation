% for checking whether the 3D algorithm has converged to the correct
% boundary. We take the cross-sections of the nucleus image and surface mesh across
% three orthogonal planes
clearvars; close all; clc;
addpath('.\BasicSnake','.\geom3d\geom3d','.\geom3d\meshes3d');

fldr = 'D:\data\Sandhya_PFTs_data\Control';
stck_num=1; nuclei_num=1;

rnme = [fldr '\readme.txt'];
rd = textread(rnme,'%s','delimiter','\n');

fnmepat = rd{1};
matpat = rd{2};
imgpat  = rd{3};
eval(['fnmes =' fnmepat ';']);

nf=stck_num; %processing this stack
bnme = sprintf(matpat,fnmes(nf));
imgsnme = sprintf(imgpat,fnmes(nf));
%file name pattern for each file in the stack
lst = dir([fldr '\' imgsnme]); szez = length(lst);
%building the stack
for nimgs=1:szez
    tmp = imread([fldr '\' lst(nimgs).name]);
    if ~strcmp(class(tmp),'uint8')
        tmp = im2uint8(tmp);
    end
    if length(size(tmp))==3
        zimg = squeeze(tmp(:,:,3));
    else
        zimg = tmp;
    end
    img(:,:,nimgs) = zimg;
end
%loading the mat file containing the nuclear information
load([fldr '\' bnme '.mat']);
whl = img; clear img;
wx=size(whl,2); wy=size(whl,1);
ndat=nuclei_num; %processing this nuclei
ncl = dat(ndat).boundary; 
bndrybx = [floor(min(ncl(:,1))) ceil(max(ncl(:,1))) floor(min(ncl(:,2))) ceil(max(ncl(:,2)))];
bndrybx = [bndrybx(1)-5 bndrybx(2)+5 bndrybx(3)-5 bndrybx(4)+5];
bndrybx = bndrybx + double(bndrybx==0);
bndrybx(1) = max(bndrybx(1),1); bndrybx(3) = max(bndrybx(3),1); 
bndrybx(2) = min(wx,bndrybx(2)); bndrybx(4) = min(wy,bndrybx(4));

img = whl(bndrybx(1):bndrybx(2),bndrybx(3):bndrybx(4),:);
imgz = max(img,[],3);
szey = size(img,1); szex = size(img,2); szez = size(img,3);
OV = dat(ndat).surf;

pts = OV.vertices(unique(OV.faces),:);

xcrd = round(szey/2); ycrd = round(szex/2); zcrd = round(szez/2);
prjx = squeeze(img(xcrd,:,:)); prjy = squeeze(img(:,ycrd,:)); prjz = squeeze(img(:,:,zcrd)); 
plnx = createPlane([xcrd ycrd zcrd],[1 0 0]);
plny = createPlane([xcrd ycrd zcrd],[0 1 0]);
plnz = createPlane([xcrd ycrd zcrd],[0 0 1]);

plysx = intersectPlaneMesh(plnx,OV.vertices,OV.faces);
plysy = intersectPlaneMesh(plny,OV.vertices,OV.faces);
plysz = intersectPlaneMesh(plnz,OV.vertices,OV.faces);

plysx = plysx{1}; plysx = plysx(:,2:3);
plysy = plysy{1}; plysy = plysy(:,[1 3]);
plysz = plysz{1}; plysz = plysz(:,1:2);

figure; 
subplot(133);
imshow(prjz); hold on;
plot(plysz(:,2),plysz(:,1),'r-');
title('XY projection');

subplot(131);
imshow(prjx); hold on;
plot(plysx(:,2),plysx(:,1),'r-');
title('YZ projection');

subplot(132);
imshow(prjy); hold on;
plot(plysy(:,2),plysy(:,1),'r-');
title('YZ projection');

OV.vertices = OV.vertices*diag(dat(ndat).pxl);
figure;  hold on;
patch(OV,'facecolor','g','facealpha',0.5); axis equal;
xlabel('X axis'); ylabel('Y axis'); zlabel('Z axis');
view(3);