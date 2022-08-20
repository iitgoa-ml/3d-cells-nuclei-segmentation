% for checking whether the 3D algorithm has converged to the correct
% boundary. We take the cross-sections of the nucleus image and surface mesh across
% three orthogonal planes
% clearvars; close all; clc;
pxl = [0.24 0.24 0.5]; pxlm = diag(1./pxl);
%addpath('.\BasicSnake','.\geom3d\geom3d','.\geom3d\meshes3d');

ln=[0.64,0.08,0.18;
    0,0.45,0.74;
    0.07,0.21,0.14;
    0.85,0.33,0.1;
    0.31,0.31,0.31;
    rand(100,3)];
% 
% clno = 12;
% 
% cfldr = 'D:\workspace\cell_shape\data\Series074\cell\';
% nfldr = 'D:\workspace\cell_shape\data\Series074\nucleus\';
% 
% cimgfnme = sprintf('%sjul19_noco_T3_series074_%d.tif',cfldr,clno);
% cmatfnme = sprintf('%sJul_19_Noco_T3_Series074-%d.mat',cfldr,clno);
% nimgfnme = sprintf('%sjul19_noco_T3_series074_%d.tif',nfldr,clno);
% nmatfnme = sprintf('%snuc_Jul_19_Control_T3_Series074-%d.mat',nfldr,clno);
% 
% info = imfinfo(cimgfnme);  %# Get the TIFF file information
% n_f = numel(info);    %# Get the number of images in the file
% cimg = uint8(zeros(info(1).Height,info(1).Width,n_f));      %# Preallocate the cell array
% for nf = 1:n_f
%   tmp = imread(cimgfnme,'Index',nf,'Info',info);
%   cimg(:,:,nf) = tmp(:,:,1);
% end
% 
% nimg = uint8(zeros(info(1).Height,info(1).Width,n_f));      %# Preallocate the cell array
% for nf = 1:n_f
%   tmp = imread(nimgfnme,'Index',nf,'Info',info);
%   nimg(:,:,nf) = tmp(:,:,3);
% end
% 
% %loading the mat file containing the cell and nuclei mesh
% load(cmatfnme); cmsh=OV1;
% load(nmatfnme); nmsh=OV;

cmsh=OV1;
cimg=stk;
%szey = size(cimg,1); szex = size(cimg,2); szez = size(cimg,3);
cmsh.vertices = cmsh.vertices*pxlm;
%nmsh.vertices = nmsh.vertices*pxlm;

xcrd = round(szey/2); ycrd = round(szex/2); zcrd = round(szez/2);

prjx(:,:,1) = squeeze(cimg(xcrd,:,:)); 
%prjx(:,:,2) = squeeze(nimg(xcrd,:,:)); 
prjx(:,:,3) = squeeze(cimg(xcrd,:,:));
prjx = rot90(prjx);
prjz(:,:,1) = squeeze(cimg(:,:,zcrd)); 
%prjz(:,:,2) = squeeze(nimg(:,:,zcrd)); 
prjz(:,:,3) = squeeze(cimg(:,:,zcrd)); 
prjy(:,:,1) = squeeze(cimg(:,ycrd,:)); 
%prjy(:,:,2) = squeeze(nimg(:,ycrd,:)); 
prjy(:,:,3) = squeeze(cimg(:,ycrd,:)); 


xcrd = 550; ycrd = 325; zcrd = 6;
plnx = createPlane([xcrd ycrd zcrd],[1 0 0]);
plny = createPlane([xcrd ycrd zcrd],[0 1 0]);
plnz = createPlane([xcrd ycrd zcrd],[0 0 1]);

cplysx = intersectPlaneMesh(plnx,cmsh.vertices,cmsh.faces); 
cplysy = intersectPlaneMesh(plny,cmsh.vertices,cmsh.faces);
cplysz = intersectPlaneMesh(plnz,cmsh.vertices,cmsh.faces);

% nplysx = intersectPlaneMesh(plnx,nmsh.vertices,nmsh.faces); 
% nplysy = intersectPlaneMesh(plny,nmsh.vertices,nmsh.faces);
% nplysz = intersectPlaneMesh(plnz,nmsh.vertices,nmsh.faces);

cplysx = cplysx{1}; cplysx = cplysx(:,2:3); 
cplysy = cplysy{1}; cplysy = cplysy(:,[1 3]);
cplysz = cplysz{1}; cplysz = cplysz(:,1:2);

% nplysx = nplysx{1}; nplysx = nplysx(:,2:3); 
% nplysy = nplysy{1}; nplysy = nplysy(:,[1 3]);
% nplysz = nplysz{1}; nplysz = nplysz(:,1:2);

figure; 
imshow(prjz); hold on;
plot(cplysz(:,2),cplysz(:,1),'c-');
% plot(nplysz(:,2),nplysz(:,1),'y-');
title('XY cross section');

figure;
imshow(prjx); hold on;
plot(cplysx(:,1),szez-cplysx(:,2),'c-');
% plot(nplysx(:,1),szez-nplysx(:,2),'y-');
title('XZ cross section');

figure;
imshow(prjy); hold on;
plot(cplysy(:,2),cplysy(:,1),'c-');
% plot(nplysy(:,2),nplysy(:,1),'y-');
title('YZ cross section');

% max_prj = max(img,[],3);
% pts = cmsh.vertices; pts=pts(unique(cmsh.faces),:); 
% bpts = boundary(pts(:,1), pts(:,2));
% 
% figure; 
% imshow(max_prj); hold on;
% plot(pts(bpts,2),pts(bpts,1),'r-');
% title('Maximum projection');

cmsh.vertices = cmsh.vertices*diag(pxl);
% nmsh.vertices = nmsh.vertices*diag(pxl);
figure;  hold on;
cptch = patch(cmsh,'facecolor','m','facealpha',0.6,'edgecolor','k','edgealpha',0.2); 
% nptch = patch(nmsh,'facecolor','g','facealpha',0.8,'edgecolor','k','edgealpha',0.2); 
set(gca,'dataaspectratio',[1 1 pxl(3)/pxl(1)],'visible','off','position',[0 0 1 1]); %, ...
    %'xlim',[-10 60],'ylim',[-10 60],'zlim',[0 30]);
set(cptch,'FaceLighting','phong','AmbientStrength',0.8)
% set(nptch,'FaceLighting','phong','AmbientStrength',0.8)
light('Position',[0 0 1],'Style','infinite');
view(470,30);
drawnow; 