function volume_lsm_folder(fldr)
%VOLUME_FOLDERS Summary of this function goes here
%   Detailed explanation goes here

%reading the readme file
rnme = [fldr '\readme.txt'];
rd = textread(rnme,'%s','delimiter','\n');
    
for npat = 1:length(rd)/2
    %processing the readme file
    fnmepat = rd{2*npat-1};
    strpat = rd{2*npat};
    eval(['fnmes =' fnmepat ';']);

    %looping through each lsm file
    for nf=1:length(fnmes)
        %name of the .mat data file
        fnme = sprintf(strpat,fnmes(nf));
        %base name
        bnme = fnme(1:findstr(fnme,'.mat')-1);
        %name of the .lsm file
        lsm_fnme = [fldr '\' bnme '.lsm'];
        %reading the .lsm file
        lsm = lsmread(lsm_fnme);
        %reading the nuclear information. In this case its the second channel
        lsm_dat = squeeze(lsm(1,2,:,:,:)); 
        [szez,szex,szey]=size(lsm_dat);
        %converting the data into a 3-d image file
        img = reshape(reshape(lsm_dat(:),[szez szex*szey])',[szex szey szez]);
        %loading the mat file containing the 2D nuclear information
        load([fldr '\' fnme]);
        %running the 3D algorithm
        dat = volume_stack_dat(img,dat);
        %saving the 3D morphologies to the .mat file
        save([fldr '\' fnme],'dat');
    end
end

end

