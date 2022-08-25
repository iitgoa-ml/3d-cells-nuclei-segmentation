function Eextern = ExternalForceImage2D(I,Wline, Wedge, Wterm,Sigma)
% Eextern = ExternalForceImage2D(I,Wline, Wedge, Wterm,Sigma)

Ix=ImageDerivatives2D(I,Sigma,'x');
Iy=ImageDerivatives2D(I,Sigma,'y');
Ixx=ImageDerivatives2D(I,Sigma,'xx');
Ixy=ImageDerivatives2D(I,Sigma,'xy');
Iyy=ImageDerivatives2D(I,Sigma,'yy');


Eline = imgaussian(I,Sigma);
Eterm = (Iyy.*Ix.^2 -2*Ixy.*Ix.*Iy + Ixx.*Iy.^2)./((1+Ix.^2 + Iy.^2).^(3/2));
Eedge = sqrt(Ix.^2 + Iy.^2); 

Eextern= (Wline*Eline - Wedge*Eedge -Wterm * Eterm); 

