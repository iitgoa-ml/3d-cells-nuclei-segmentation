
clearvars
close all

%% Reading a stack of png or tiff images file
location = %__FILE_LOCATION_HERE__;
fileNames = dir(fullfile(location, '*.tif'));
for nf=1:length(fileNames)
filename = [fileNames(nf).folder '/' fileNames(nf).name];
end
%filename= <Stack_location/name> %% If input is a tiff stack file,
% uncomment this line and comment everything above.
stk=TIFFStack(filesname);
for i = 1:size(stk,3)
nuc(:,:,i)=stk(:,:,i,1);
end

%%
[OV,Options]=algo_snakes_3D(nuc); %initialise the snakes algorithm. 
OV1=OV;
xypxl = 0.2405; zpxl=0.5000; %pixel distance in x,y and z directions.
%scaling the surface according to the voxel size
OV.vertices = OV.vertices*diag([xypxl,xypxl,zpxl]);
%projecting the surface for the projected area and

pts = OV.vertices(unique(OV.faces),:);
ptsprj = pts(:,1:2);
fcs = delaunay(ptsprj); n_fcs=size(fcs,1);
%projected area
area3 = sum(abs(polyarea(reshape(pts(fcs',1),[3 n_fcs]),reshape(pts(fcs',2),[3 n_fcs]))));
[vol3, srfar3]=stlVolume(OV.vertices',OV.faces'); 
patch(OV,'facecolor','m','facealpha',0.6,'edgecolor','k','edgealpha',0.2);
%dat(nf).OV_N=OV;dat(nf).PA=area3; dat(nf).SA=srfar3; dat(nf).V=vol3;
%dat(nf).Alpha=Options.Alpha; dat(nf).Beta=Options.Beta; dat(nf).Kappa=Options.Kappa; dat(nf).Delta=Options.Delta; dat(nf).Location=A;
Slice_print(stk,OV1,i)
