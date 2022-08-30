# Dataset

The dataset comprises confocal images of cells and nuclei of five cell lines: NIH-3T3, Huh7, MCF7, MDAMB231, and HeLa cells. The below image gives a quick look at how versatile the dataset is. 

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/data/img/five_diff_types_cells.jpg" style="width: 1100px; height: auto;">

The data is available [here](https://drive.google.com/drive/folders/1OpHNcURcIR1LfboVWk-IzWpp2xeMjIuX?usp=sharing). We organize the folders inside the data in the below format. 

* **Cells-Nuclei.** Contains cells and their respective nuclei. The below five folders are the original image stacks from different cell lines. 
  * BreastCancerCells_MCF7
  * BreastCancerCells_MDAMB231
  * CervicalCancerCells_HeLa
  * Fibroblasts_3T3
  * LiverCancerCells_Huh7
  * Processed_datasets (This folder contains the datasets pre-processed from the above five cell lines)
    * Cells_and_Nucleus_processed_for_active_contour
      * Cross Section Figures (Contains the output files for visualizations)
      * Dataset (Input to the active contour)
      * Outputs (Expected outputs for the above dataset)
    * Cells_processed_for_CA-UNet
      * final_images (pre-processed dataset used for training)
      * final_masks (true labels for the above dataset)

* **Nuclei.** Only nucleus data is available for the below five cell lines. 
  * MCF7
  * MDAMB231
  * HeLa
  * 3T3
  * Huh7

## Watershed-Based Active Contours

Watershed-based active contours method is applied to cells and nuclei, respectively. A sample of a single slice from the dataset is shown below. The slice consists of cancer cells and their respective nuclei, the red channel represents the cell body, and the green channel represents their nuclei. The physical size of each pixel in an image was 0.24μm.

<img src="https://github.com/iitgoa-ml/cell-segmentation/blob/master/data/img/fig1.1.jpeg" style="width: 400px; height: auto;">

For running the snakes-based segmentation, download the single cell dataset [here](https://drive.google.com/drive/folders/1pF_CMN2xSa-uDNoAEBFeSwOR3odVDFmu?usp=sharing) and its segmented outputs in [here](https://drive.google.com/drive/folders/1AzJdeFaWMrHG-7JSksVIEMJPHbz67shV?usp=sharing). Each folder for each cell type has different series.

## CA-UNet

CA-UNet has applied only to cells. The below image is a single slice of cell and its respective "true" label from the cell stack. 

<img src="https://github.com/iitgoa-ml/3d-cells-nuclei-segmentation/blob/master/cells/CA-UNet/img/single_cells.jpg" style="width: 300px; height: auto;">

For training the deep learning model CA-UNet, the following folders are required (images and true labels)

1. [Images](https://drive.google.com/drive/folders/1DsBemi0SJABBXLbfHH8Oc_LPZrXJgHmI?usp=sharing)
2. [True labels](https://drive.google.com/drive/folders/1YdHcifuDtNevRbwIp3_4dVlkkHPQ-cwF?usp=sharing)

Images folder comprises pre-processed single-cell stacks from different cell types. True labels contain their respective masks manually segmented using the ImageJ tool.
