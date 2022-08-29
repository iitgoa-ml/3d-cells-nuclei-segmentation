
**Requirements:**
image processing toolbox in matlab 

snakes3D library from matlab file exchange:  Dirk-Jan Kroon (2022). Snake : Active Contour (https://www.mathworks.com/matlabcentral/fileexchange/28149-snake-active-contour), MATLAB Central File Exchange. .

Steps for single cell segmentation:
1. Main.m: It takes the location of the cropped cell from a multicell image stack or any other single cell image from the dataset.
2. algo_snakes_3D.m: This file takes a 3D matrix of cell from the main file as input. It does preprocessing and extracts the initial approximate boundary that is an input to snakes algorithm. Parameters such as coefficients for ‘membrane energy’, ‘thin plate energy’, and ‘balloon force’, for the 3D surface for the snakes algorithm can be tuned here.
3. Snake3D.m: This file takes the initialised cell boundary and the parameters from algo_snakes_3D.m as input. The function performs 3D segmentation using snakes algortihm to get the segmented 3D surface of the cells. 


## Watershed-Based Active Contours

If there is a stack with multiple cells, this method detects the cells, finds their approximate cell boundary, and an extra 3D stack of each cell to be individually segmented using the Active Snakes algorithm. 
