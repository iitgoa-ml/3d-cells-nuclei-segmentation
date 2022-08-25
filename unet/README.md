# Condensed-Attention UNet (CA-UNet)

We developed a new version of 3D UNet to solve Cell Segmentation from 3D Confocal Images. It uses the advantages of an [attention gate](https://arxiv.org/abs/1808.08114) and [Condensed UNet](https://ieeexplore.ieee.org/abstract/document/9098351?casa_token=qVbQemXwQ-QAAAAA:wJMFyoqccX1yp1NLFs5IIbnQZ-x2JOGV2S8U6MLNEMIagDVInVRovhlazaRXww-VcjKoTQ) architecture to better segment the confocal images.


<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/unet/img/3d_caunet_page-0001.jpg" style="width: 900px; height: auto;">

## Dependencies
The Packages listed below are required to be installed

1. python 3.7
2. tensorflow-gpu
3. numpy
4. tiffile
5. scikit-image
6. keras
7. opencv2
8. tqdm

## Dataset
The single cell dataset consists of single cell stacks manually cropped from the original cell dataset. It consists of four different types of cell types, namely, liver, fibroblast, breast cancer MCF7, breast cancer MDBMA31 cells. 

For training the model, we manually segmented the cell stack to generate the true labels. Below is the sample of single slice from an cell stack along with its true label on the right.

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/unet/img/single_cells.jpg" style="width: 300px; height: auto;">

## Preprocessing of the data

As Mentioned above, the dataset consists of slices of a cell where each slice saved as an tif file. We use this step to stack the slices to a 3D cell stack. During the stacking, we perform few transformation techniques like making aspect ratio equal and resizing the cells to 256 x 256.

Run the below line for execution (Note: please change the path to the dataset folder inside the python file)
```bash
python3 stacking.py
```

## Training the model

To train the model from scratch for cell segmentation, use the final_image and final_mask folder path in 3dcondensedattentionunet.py. The final_image consists of the series of 3D_cells and each series contains a single cell slices. final_mask folder consists of the corresponding true labels of the series of cells present in final_image.
```bash
python3 3dcondensedattentionunet_single.py
```

## Testing the Model

The pretrained model weights can be downloaded from [here](https://drive.google.com/file/d/1GyorsLVPLmJJctHXwUnInGqVM2Jf64rW/view?usp=sharing)

In order to test the model, use the above pre-trained weights in the below python file. Use the sample cell data present in [sample dataset](https://github.com/iitgoa-ml/cell-segmentation/tree/master/data/sample%20dataset) for testing.
 ```bash
 python3 final_predict.py
 ```
## Baselines
We have other versions of unet architectures like Standard UNet (3dunet.py), Condensed UNet (3dcondensedunet.py) and Attention UNet (3dattention_unet.py) for comparision. 

