function [OV,Options] = algo_snakes_3D(img)

%options for the snake algorithm
Options=struct;
Options.Verbose=0;
Options.Iterations=200;
Options.GIterations=100;
Options.Alpha=0.02*3.3;
Options.Beta=0.05*3.3;
Options.Kappa=1;
Options.Delta=0.05;
Options.Wline=0;
Options.Mu=0.1;
Options.Sigma1=1;
Options.Sigma2=1;
Options.Sigma3=1;

szey = size(img,1); szex = size(img,2); szez = size(img,3);

thres = graythresh(img);
Gbw = img>=round(255*thres);
Gfl = reshape(imfill(reshape(Gbw,szey,szex*szez),'holes'),szey,szex,szez);
Gfl = bwareaopen(Gfl,100);

bwsml = imdilate(imerode(Gfl,strel('disk',3)),strel('disk',3));

%getting the boundary pixels - approximate
GX = circshift(bwsml,[1 0 0]);
GY = circshift(bwsml,[0 1 0]);
GZ = circshift(bwsml,[0 0 1]);
Xbound = abs(GX-bwsml); Ybound = abs(GY-bwsml); Zbound = abs(GZ-bwsml);
bnd = or(or(Xbound,Ybound),Zbound);

%largest component
cmp = bwconncomp(bnd,18);
mx=1;
for nobj=2:cmp.NumObjects
    if length(cmp.PixelIdxList{nobj}) > length(cmp.PixelIdxList{mx})
        mx=nobj;
    end
end
bnd = false(szey,szex,szez); bnd(cmp.PixelIdxList{mx})=true;
[bndx,bndy,bndz]=ind2sub([szey szex szez],find(bnd));

%starting surface - initial guess
conv = convhull(bndx,bndy,bndz);

%adjusting the image for removing noise while calculating gradients
adj = reshape(imadjust(reshape(img,szey,szex*szez)),[szey szex szez]);
thres = graythresh(adj);
almst = reshape(imadjust(reshape(adj,szey,szex*szez),[0.5*thres min(1.5*thres,1)]),[szey szex szez]);
almst = double(almst)/255;

msh.vertices = [bndx bndy bndz]; msh.faces=conv;

%snake algorithm
OV=Snake3D(almst,msh,Options);

end