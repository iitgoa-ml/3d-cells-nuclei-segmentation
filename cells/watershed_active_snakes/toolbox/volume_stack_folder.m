function volume_stack_folder(fldr)
%VOLUME_STACK_FOLDER Summary of this function goes here
%   Detailed explanation goes here

%reading the readme file
rnme = [fldr '\readme.txt'];
rd = textread(rnme,'%s','delimiter','\n');
    
for npat = 1:length(rd)/3
    %processing the readme file
    fnmepat = rd{3*npat-2};
    matpat = rd{3*npat-1};
    imgpat  = rd{3*npat};
    eval(['fnmes =' fnmepat ';']);

    %looping through each image stack
    for nf=1:length(fnmes)
        bnme = sprintf(matpat,fnmes(nf));
        imgsnme = sprintf(imgpat,fnmes(nf));
        %file name pattern for each file in the stack
        lst = dir([fldr '\' imgsnme]); szez = length(lst);
        %building the stack
        for nimgs=1:szez
            tmp = imread([fldr '\' lst(nimgs).name]);
            if ~strcmp(class(tmp),'uint8')
                tmp = im2uint8(tmp);
            end
            if length(size(tmp))==3
                zimg = rgb2gray(tmp);
            else
                zimg = tmp;
            end
            img(:,:,nimgs) = zimg;
        end
        %loading the mat file containing the 2D nuclear information
        load([fldr '\' bnme '.mat']);
        %running the 3D algorithm
        dat = volume_stack_dat(img,dat);
        %saving the 3D morphologies to the .mat file
        save([fldr '\' bnme '.mat'],'dat');
    end
end

end

