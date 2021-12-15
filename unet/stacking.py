import cv2
import numpy as np
import os
from skimage.transform import resize
import tifffile as tif
import sys
#np.set_printoptions(threshold=sys.maxsize)

train_cell_path="3D_single_dataset/train/cells/"
train_cell_mask_path = "3D_single_dataset/train/cell_masks/"

final_cell_path="3D_single_dataset/train/final_images/"
final_cell_mask_path="3D_single_dataset/train/final_masks/"

images=sorted(os.listdir(train_cell_path))
masks=sorted(os.listdir(train_cell_mask_path))

img_height=256
img_width=256
depth=16

def nextPowerOf2(n): 
    	n -= 1
    	n |= n >> 1
    	n |= n >> 2
    	n |= n >> 4
    	n |= n >> 8
    	n |= n >> 16
    	n += 1
    	return n

def equal_ratio(img):
	h=img.shape[0]
	w=img.shape[1]
	if(h<w):
		extra=[[0]*w for i in range(w-h)]
		actual=np.vstack((img,extra))
	else:
		extra=[[0]*(h-w) for i in range(h)]
		actual=np.hstack((img,extra))
	return actual       

for i in images:
	path1= os.path.join(train_cell_path,i)
	path2= os.path.join(train_cell_mask_path,i)
	p1=sorted(os.listdir(path1))
	p2=sorted(os.listdir(path2))
	print("p1",p1)
	print("p2",p2)
	if(p1==p2):
		print("EQUAL")
	else:
		print("NOT EQUAL")

	print("i",i)
	print("====================================================")
	image=[]
	mask=[]
	for j in p1:
                img=cv2.imread(os.path.join(path1,j))
                img=cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
                img=equal_ratio(img)
                img = resize(img, (img_height, img_width), mode='constant', preserve_range=True)
                img=np.expand_dims(img,-1)
                image.append(img)
    
                msk=cv2.imread(os.path.join(path2,j))
                #if(len(msk.shape)==3):
                msk=cv2.cvtColor(msk, cv2.COLOR_BGR2GRAY)
                msk=equal_ratio(msk)
                msk = resize(msk, (img_height, img_width), mode='constant', preserve_range=True)
                msk=np.expand_dims(msk,-1)
                mask.append(msk)
	#depth=nextPowerOf2(len(p1))
	while(len(image)!=depth):
                k=np.zeros((img_height,img_width))
                k=np.expand_dims(k,-1)
                image.append(k)
	image=np.stack(image,axis=0)
        
	while(len(mask)!=depth):
                k=np.zeros((img_height,img_width))
                k=np.expand_dims(k,-1)
                mask.append(k)
	mask=np.stack(mask,axis=0)
	print("shape",image.shape,mask.shape)

	tif.imsave(final_cell_path+i+'.tif',image)
	tif.imsave(final_cell_mask_path+i+'.tif',mask)
print("STACKING DONE!!!")