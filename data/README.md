
# Dataset
The dataset consists of confocal images of cells and nuclei. It includes five cell lines, NIH-3T3, Huh7, MCF7, MDAMB231, and HeLa cells. Below image gives an quick look on how versatile the dataset is. 

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/data/img/five_diff_types_cells.jpg" style="width: 1100px; height: auto;">

## Watershed-Based Active Contours
Watershed-based active contours method is applied on cells and nucleus respectively. 
Sample of a single slice from the dataset is shown below. The slice consists of cancer cells and their respective nuclei, the red channel represents the cell body, and the green channel represents their nuclei. The physical size of each pixel in an image was 0.24μm.

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/data/img/fig1.1.jpeg" style="width: 400px; height: auto;">

For running the snakes based segmentation, download the single cell dataset [here](https://drive.google.com/drive/folders/1pF_CMN2xSa-uDNoAEBFeSwOR3odVDFmu?usp=sharing) and its segmented outputs in [here](https://drive.google.com/drive/folders/1AzJdeFaWMrHG-7JSksVIEMJPHbz67shV?usp=sharing). Each folder for each cell type has different series.

## CA-UNet
CA-UNet is applied only cells. Below image is a single slice of cell and its respective true label from the cell stack. 

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/unet/img/single_cells.jpg" style="width: 300px; height: auto;">

For training the deep learning model, CA-UNet from scratch, below are the folders required (images and true labels)

1. [Images](https://drive.google.com/file/d/1SqBszFNqwly6LsILFYyEc6e_QWrqB_gg/view?usp=sharing)
2. [True labels](https://drive.google.com/file/d/1NVauota4nr1uI2kvt9aGkzeXgEa_813T/view?usp=sharing)

Images folder comprises of single cell stacks from different cell types. True labels contains its respective masks which are manually segmented using ImageJ tool. 




 



