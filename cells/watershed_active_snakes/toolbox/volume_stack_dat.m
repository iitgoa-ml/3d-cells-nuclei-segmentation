function dat = volume_stack_dat(whl,dat)

wx=size(whl,2); wy=size(whl,1);
n_dat = length(dat);

for ndat = 1:n_dat
    if ~dat(ndat).include 
        dat(ndat).surf = [];
    else 
        ncl = dat(ndat).boundary; 
        bndrybx = [floor(min(ncl(:,1))) ceil(max(ncl(:,1))) floor(min(ncl(:,2))) ceil(max(ncl(:,2)))];
        bndrybx = [bndrybx(1)-5 bndrybx(2)+5 bndrybx(3)-5 bndrybx(4)+5];
        bndrybx = bndrybx + double(bndrybx==0);
        bndrybx(1) = max(bndrybx(1),1); bndrybx(3) = max(bndrybx(3),1); 
        bndrybx(2) = min(wx,bndrybx(2)); bndrybx(4) = min(wy,bndrybx(4));

        img = whl(bndrybx(1):bndrybx(2),bndrybx(3):bndrybx(4),:);
        dat(ndat).surf = algo_snakes_3D(img);
    end
end

end