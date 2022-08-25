function [vd,fd] = rm_nouse_vertices(v,f)
%RM_NOUSE_VERTICES Summary of this function goes here
%   Detailed explanation goes here
n_v = size(v,1);
fii = zeros(n_v,10,2);
n_fs = zeros(n_v,1);

for nf=1:size(f,1)
    n_fs(f(nf,:))=n_fs(f(nf,:))+1;
    fii(f(nf,1),n_fs(f(nf,1)),:)=[nf 1];
    fii(f(nf,2),n_fs(f(nf,2)),:)=[nf 2];
    fii(f(nf,3),n_fs(f(nf,3)),:)=[nf 3];
end

kp_ndes = n_fs>0;
vd = v(kp_ndes,:);
fii = fii(kp_ndes,:,:);

for n1=1:size(fii,1)
    for n2=1:size(fii,2)
        if fii(n1,n2,1)
            fd(fii(n1,n2,1),fii(n1,n2,2))=n1;
        end
    end
end

end

