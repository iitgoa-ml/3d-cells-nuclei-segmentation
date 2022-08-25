function c = ContourCurvature2D(Od,p,n)
%CONTOURCURVATURE2D fits an pth order polynomial at the odd number of points (n) and
%calculates the curvature at the middle point
c=zeros(size(Od,1),1);
sde=(n-1)/2;

for npts=1:size(Od,1)
    Oshft=circshift(Od,sde-npts+1);
    x=Oshft(1:n,1); y=Oshft(1:n,2);
    x0=x(sde+1); y0=y(sde+1);

    %get the tangent and normal directions
    ply=polyfit(x,y,1); m=ply(1);
    xdir=[1 m]/sqrt(1+m^2); 
    dx=x(sde+3)-x(sde-1); dy=y(sde+3)-y(sde-1);
    if dot(xdir,[dx dy])<0 xdir=-xdir; end
    ydir=[-xdir(2) xdir(1)];

    %transform the coordinates such that normal is along the y-direction
    trnsf=[xdir; ydir]*[x-x0 y-y0]';
    xt=trnsf(1,:); yt=trnsf(2,:);

    %calculate curvature by fitting a pth order polynomial
    xd0=xt(sde+1); yd0=yt(sde+1);
    xt(sde+1)=[]; yt(sde+1)=[];
    A=zeros(p,p); b1=zeros(p,1); b2=zeros(p,1);
    tv=linspace(-1,1,n); tv(sde+1)=[]; 
    for row=1:p
        b1(row) = sum((xt-xd0).*(tv.^row));
        b2(row) = sum((yt-yd0).*(tv.^row));
        for col=1:p
            A(row,col)=sum(tv.^(row+col));
        end
    end
    ax = A\b1;
    ay = A\b2;
    
    %curvature
    c(npts)= 2*(ax(1)*ay(2) - ax(2)*ay(1))/((ax(1)^2+ay(1)^2)^(3/2));
end  

