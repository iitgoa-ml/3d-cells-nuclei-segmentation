function read_stack_proj_run2D(fldr,pxl)

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
        fprintf('Processing %s in %s\n',bnme,fldr);
        imgsnme = sprintf(imgpat,fnmes(nf));
        %file name pattern for each file in the stack
        lst = dir([fldr '\' imgsnme]); szez = length(lst);
        %building the stack
        for nimgs=1:szez
            tmp = imread([fldr '\' lst(nimgs).name]);
            if length(size(tmp))==3
                zimg = squeeze(tmp(:,:,3));
            else
                zimg = tmp;
            end
            img(:,:,nimgs) = zimg;
        end
        %calculating the maximum projection
        imgz = im2uint8(max(img,[],3));
        %running the 2D algorithm on the maximum projection
        dat = algo_snakes_noadj(imgz,pxl(1),false);
        %saving the pixel size for each nucleus
        for ndat=1:length(dat)
            dat(ndat).pxl = pxl;
        end
        %saving the mat file containing the nucleus data
        save([fldr '\' bnme '.mat'],'dat');
        %writing the maximum projection image file
        imwrite(imgz,[fldr '\' bnme '.tif']);
        clear img;
    end
end