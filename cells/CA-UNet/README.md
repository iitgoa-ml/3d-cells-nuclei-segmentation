# Condensed-Attention UNet (CA-UNet)

This folder implements a variant of 3D UNet to segment 3D Confocal Images of cells. It uses the advantages of Attention Gate, e.g., see [paper](https://arxiv.org/abs/1808.08114) and [Condensed UNet](https://ieeexplore.ieee.org/abstract/document/9098351?casa_token=qVbQemXwQ-QAAAAA:wJMFyoqccX1yp1NLFs5IIbnQZ-x2JOGV2S8U6MLNEMIagDVInVRovhlazaRXww-VcjKoTQ) architectures to better segment confocal images.


<img src="https://github.com/iitgoa-ml/3d-cells-nuclei-segmentation/blob/master/cells/CA-UNet/img/3d_caunet_page-0001.jpg" style="width: 900px; height: auto;">

## Dependencies

The packages listed below are required. 

1. `python 3.7`
2. `tensorflow-gpu`
3. `numpy`
4. `tiffile`
5. `scikit-image`
6. `keras`
7. `opencv2`
8. `tqdm`

## Data

The single cell dataset consists of single cell stacks manually cropped from the original cell dataset. It consists of four types of cell types: liver, fibroblast, breast cancer MCF7, and breast cancer MDBMA31 cells. 

We manually segmented the cell stack to generate the *true* labels to train the model. The below sample shows a single slice from a cell stack along with its *true* label on the right.

<img src="https://github.com/iitgoa-ml/3d-cells-nuclei-segmentation/blob/master/cells/CA-UNet/img/single_cells.jpg" style="width: 300px; height: auto;">

### Preprocessing of the data

The dataset consists of cells' slices, where each slice is saved as a TIF file. We use this step to stack the slices to a 3D cell stack. We perform a few transformation techniques during the stacking, like making the aspect ratio equal and resizing the cells to 256 X 256.

Run the below line for execution (Note: please change the path to the dataset folder inside the python file)

		python3 stacking.py


## Model training 

To train the segmentation model, set the `final_image` and `final_mask` folders paths in `3dcondensedattentionunet.py`. The `final_image` folder consists of a series of 3D_cells, and each series contains single cell slices. The `final_mask` folder consists of the corresponding true labels of the series of cells present in `final_image`. 

		python3 3dcondensedattentionunet_single.py


## Model evaluation 

We can download the pre-trained model weights from [here](https://drive.google.com/file/d/1GyorsLVPLmJJctHXwUnInGqVM2Jf64rW/view?usp=sharing). 

To test the model, use the pre-trained weights in the below python file. Use the sample cell data present in [sample dataset](https://github.com/iitgoa-ml/cell-segmentation/tree/master/data/sample%20dataset) for testing.
 
 		python3 final_predict.py
 
## Baseline models 

This folder also includes other variants of unet architectures like *Standard UNet* (`3dunet.py`), *Condensed UNet* (`3dcondensedunet.py`), and *Attention UNet* (`3dattention_unet.py`) for comparison. 