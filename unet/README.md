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

wget https://drive.google.com/file/d/1GyorsLVPLmJJctHXwUnInGqVM2Jf64rW/view?usp=sharing

Use the above pre-trained weights in final_predict.py for testing. You can try the sample data present in the data folder for testing.**

**Training the model**

To train the model from scratch for cell segmentation, use the final_image and final_mask folder path in 3dcondensedattentionunet.py. The final_image consists of the series of 3D_cells and each series contains a single cell slices. final_mask folder consists of the corresponding ground_truths of the series of cells present in final_image.

python3 3dcondensedattentionunet_single.py

We have other versions of unet architectures like standard unet (3dunet.py), condensed_unet (3dcondensedunet.py) and attention_unet (3dattention_unet.py)
