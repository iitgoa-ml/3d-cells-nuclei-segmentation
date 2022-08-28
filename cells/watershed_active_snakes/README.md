
**Requirements:**
image processing toolbox in matlab 

snakes3D library from matlab file exchange:  Dirk-Jan Kroon (2022). Snake : Active Contour (https://www.mathworks.com/matlabcentral/fileexchange/28149-snake-active-contour), MATLAB Central File Exchange. .

## Watershed-Based Active Contours

If there is a stack with multiple cells, this method detects the cells, finds their approximate cell boundary, and an extra 3D stack of each cell to be individually segmented using the Active Snakes algorithm. 