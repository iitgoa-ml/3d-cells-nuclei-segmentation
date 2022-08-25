function [OV,Options] = algo_snakes_3D(img)

%options for the snake algorithm
Options=struct;
Options.Verbose=0;
Options.Iterations=100; %0.02	0.05	2	0.02
Options.GIterations=100;
Options.Alpha=0.02;
Options.Beta=0.09;
Options.Kappa=1.3;
Options.Delta=0.095;
Options.Wline=0; 
Options.Wterm=0;
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

%getting the boundary pixels
GX = circshift(bwsml,[1 0 0]);
GY = circshift(bwsml,[0 1 0]);
GZ = circshift(bwsml,[0 0 1]);
Xbound = abs(GX-bwsml); Ybound = abs(GY-bwsml); Zbound = abs(GZ-bwsml);
bnd = or(or(Xbound,Ybound),Zbound);

%largest component
% cmp = bwconncomp(bnd,8);
% mx=1;
% for nobj=2:cmp.NumObjects
%     if length(cmp.PixelIdxList{nobj}) > length(cmp.PixelIdxList{mx})
%         mx=nobj;
%     end
% end
% bnd = false(szey,szex,szez); bnd(cmp.PixelIdxList{mx})=true;
% [bndx,bndy,bndz]=ind2sub([szey szex szez],find(bnd));

cmp = bwconncomp(bnd,18);
labeled = labelmatrix(cmp);
mx=1;
for nobj=2:cmp.NumObjects
    labeled(labeled == nobj) = mx;
end
S = regionprops(labeled ,'PixelIdxList','ConvexHull','Perimeter','Centroid');
bnd = false(szey,szex,szez); bnd(S.PixelIdxList)=true;
[bndx,bndy,bndz]=ind2sub([szey szex szez],find(bnd));

%For Boundary
%  if length(stats2)>1
%             cntrds=reshape([stats2.Centroid],[2 length(stats2)])';
%             [~,id]=min(sqrt((cntrds(:,1)-ocntrd(1)).^2 + (cntrds(:,2)-ocntrd(2)).^2));
%             pts2=stats2(id).ConvexHull;
% else
%             pts2=stats2.ConvexHull;
% end



%starting surface
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