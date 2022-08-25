function plotContourCurvature2D(Od,c,cmp)

% cmp=colormap('jet');
lcmp=size(cmp,1);

% cmin=min(c); cmax=max(c); 
cmin=-0.2; cmax=0.2;
lclr=cmax-cmin;
c(c<cmin)=cmin; c(c>cmax)=cmax;

for npts=1:size(Od,1)-1
    indx=ceil((c(npts)-cmin)*lcmp/lclr);
    if indx==0, indx=1; end
    clr=cmp(indx,:);
    lne = line([Od(npts,2) Od(npts+1,2)],[Od(npts,1) Od(npts+1,1)],'linestyle','-',...
         'color',clr,'linewidth',2);
%     set(lne,'hittest','off');
end

npts=npts+1;
indx=ceil((c(npts)-cmin)*lcmp/lclr);
if indx==0 indx=1; end
clr=cmp(indx,:);
lne = line([Od(npts,2) Od(1,2)],[Od(npts,1) Od(1,1)],'linestyle','-',...
     'color',clr,'linewidth',2);
% set(lne,'hittest','off');

end