function dat= algo_snakes_noadj(img,pxl,enhance)

dmin=5; %minimum diameter of nucleus is um
dmax=40; %maximum diameter of nucleus in um

Options.Verbose=false;
Options.Iterations=2000;
Options.GIterations=200;
Options.Alpha=0.02;
Options.Beta=0.05;
Options.Kappa=1;
Options.Delta=0;
Options.Wline=0; Options.Wterm=0;
Options.Mu=0.1;
Options.Sigma1=1;
Options.Sigma2=1;
Options.Sigma3=1;

Options.Exitcon=0.01;
load jetcolormap.mat;

dmxpxl=dmax/pxl; dmnpxl=dmin/pxl;

Amin=pi*(dmin^2)/4; amnpxl=Amin/(pxl^2);
Amax=pi*(dmax^2)/4; amxpxl=Amax/(pxl^2);

if length(size(img))>2
    img=img(:,:,1:3);
    gry = rgb2gray(img);
else
    gry = img;
end
    
szex = size(gry,2); szey=size(gry,1);

%enhancing the image
if enhance
    enhnc = adapthisteq(gry,'cliplimit',0.05,'distribution','rayleigh');
    enhnc = medfilt2(enhnc,[2 2]);
    imshow(enhnc); hold on;
else
    enhnc = gry;
    imshow(gry); hold on;
end
%thresholding
thres = graythresh(enhnc);
bw = imbinarize(enhnc,thres);

%removing the small regions
bwrmsml = bwareaopen(bw,ceil(amnpxl));

%opening to remove noise - radius 10% of the smallest nuclei
bwnoiserm = imopen(bwrmsml,strel('disk',ceil(dmnpxl/10)));

%removing the small regions
bwrmsml = bwareaopen(bwnoiserm,ceil(amnpxl));

%filling the holes
bwfl = bwfill(bwrmsml,'holes');

%smoothing and enlarging
bwenlrge = imdilate(imerode(bwfl,strel('disk',3)),strel('disk',6));

%removing the small regions
hullrmsml = bwareaopen(bwenlrge,ceil(amnpxl));

% convex hull for snake outer boundaries
stats = regionprops(bwfl,'ConvexHull','ConvexImage','PixelList','Centroid');

%adjusting the original image
% adj = imadjust(gry); 
% adj=gry;

for nst=1:length(stats)
    pxls=stats(nst).PixelList;
    if any([any(pxls(:,1)==1) any(pxls(:,2)==1) any(pxls(:,1)==szex) any(pxls(:,2)==szey)])
        dat(nst).include=false;
    else
        pts=stats(nst).ConvexHull;
        ocntrd=stats(nst).Centroid;
        %bounds of the convex hull
        bnds = [floor(min(pts(:,1))) ceil(max(pts(:,1))) floor(min(pts(:,2))) ceil(max(pts(:,2)))];
        bnds = bnds + double(bnds==0);
        %innerhull
        hullclp = hullrmsml(bnds(3):bnds(4),bnds(1):bnds(2));
        inhullerdd = imerode(hullrmsml,strel('disk',2));
        stats2 = regionprops(inhullerdd,'ConvexHull','Perimeter','Centroid');
        if length(stats2)>1
            cntrds=reshape([stats2.Centroid],[2 length(stats2)])';
            [~,id]=min(sqrt((cntrds(:,1)-ocntrd(1)).^2 + (cntrds(:,2)-ocntrd(2)).^2));
            pts2=stats2(id).ConvexHull;
        else
            pts2=stats2.ConvexHull;
        end
        %clipping the adjusted image
        adjclp = enhnc(bnds(3):bnds(4),bnds(1):bnds(2));
        %adjusting the clipped image
%         adjclp = imadjust(gryclp);
        %size of the clipped image
        clpx = bnds(2)-bnds(1)+1; clpy = bnds(4)-bnds(3)+1;
        %setting pixels outside the hull to zero
        ohullmsk= poly2mask(pts(:,1)-bnds(1),pts(:,2)-bnds(3),clpy,clpx);
        adjclpflt = adjclp.*uint8(ohullmsk);
        %adjusting the image again
        adjadj = imadjust(adjclp);
        %thresholding between 70% and 130% of the Otsu's threshold value
        thres1 = graythresh(adjadj);
        if thres1
            almstthres = imadjust(adjadj,[0.7*thres1 min(1.3*thres1,1)]);
        else
            almstthres = adjadj;
        end
        %filling the holes
        fld = imfill(almstthres,'holes');
        %calculating the perimeter of the initial contour
        xcrd=pts2(:,2)-bnds(3); ycrd=pts2(:,1)-bnds(1);
        perim = CurveLength2D([xcrd; xcrd(1)],[ycrd; ycrd(1)]);
        %setting the number of points to 5 per um
        Options.nPoints = ceil(perim*pxl*5);
        dbl = im2double(fld);
        %snake algorithm to converge to the boundary of the nuclei
        O=Snake2D(dbl,[pts2(:,2)-bnds(3) pts2(:,1)-bnds(1)] ,Options);
        %removing nuclei less than a threshold area
        if abs(polyarea(O(:,1),O(:,2)))>amnpxl/3 && abs(polyarea(O(:,1),O(:,2)))<amxpxl
            %interpolate points to equal distance along the boundary
            Od=InterpolateContourPoints2D(O,Options.nPoints);
            %translating the nuclei boundary to that in the original image
            Od=[Od(:,1)+bnds(3) Od(:,2)+bnds(1)];
            dat(nst).boundary=Od;cntrd=mean(Od);
            %plotting the boundary                                                                              
            figure(1);
            plot(Od(:,2),Od(:,1));
            drawnow;
            dat(nst).include=true;
        else
            dat(nst).include=false;
        end
    end
end

end