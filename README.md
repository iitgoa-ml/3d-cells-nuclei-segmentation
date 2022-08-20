# Cell-Segmentation
This is an implementation of active snakes algorithm in matlab.
Following are the files:
1. Main.m: Initialises the stack.
2. algo_snakes_3D: Processes the stack to be given as an input to snakes algorithm. Paratemers for snakes algorith are defined in this file. 
3. Snake3D: 3D Snakes algortihm.
4. Watershed algortihm: If there is a stack with multiple cells, this method detects the cells, find their approximate cell boundary and extra 3D stack of each cell to be individually segmented using active snakes algorithm.
5. There are a set of helper functions in folder toolbox. 

# DATASET:
Dataset contains multiple cell types with each folder representing each cell type. 
Each folder has stacks of different cells of the same cell type. 
We have also supplemented the 3D Segmented outputs of each cell as matlab figures. 
