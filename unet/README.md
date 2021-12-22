@anusha-devulapally please add all the scripts used here and provide a documentation for how to use. 

**Condensed-Attention UNet** 
We developed a new version of UNet which uses the advantages of an attention gate and Condensed UNet architecture.

The Packages listed below are required to be installed
1. python 3.7
2. tensorflow-gpu
3. numpy
4. tiffile
5. scikit-image
6. keras
7. opencv2
8. tqdm
--- version will be updated later -----

**Preprocessing of the data**
If the dataset consists of slices of a cell where each slice saved as an tif file, then use this step to stack the slices to a 3D cell. During the stacking, we perform few transformation techniques like making aspect ratio equal and resizing the cells to 256 x 256.

Run the below line for execution (Note: please change the path to the dataset folder inside the python file)
python3 stacking.py

**Testing the Model**
Inorder to test the model, the pretrained weights can be downloaded from the below link and use it directly.
