import tensorflow as tf
from skimage.io import imread, imsave
import cv2
import numpy as np
from tensorflow.keras.models import load_model
import tifffile as tif
img_path="3D_single_dataset/test/images/1.tif"
msk_path="3D_single_dataset/test/masks/1.tif"

def f1_metric(y_true, y_pred):
  true_positives = K.sum(K.round(K.clip(y_true * y_pred, 0, 1)))
  possible_positives = K.sum(K.round(K.clip(y_true, 0, 1)))
  predicted_positives = K.sum(K.round(K.clip(y_pred, 0, 1)))
  precision = true_positives / (predicted_positives + K.epsilon())
  recall = true_positives / (possible_positives + K.epsilon())
  f1_val = 2*(precision*recall)/(precision+recall+K.epsilon())
  return f1_val
  
image=imread(img_path)
#tif.imsave('image.tif',image)
mask=imread(msk_path)
#tif.imsave('mask.tif',mask)
print("images",image.shape)
print("masks",mask.shape)

x_test=np.zeros((1,16,256,256,1),dtype=np.uint8)
y_test=np.zeros((1,16,256,256,1),dtype=np.bool)
x_test[0]=image
y_test[0]=mask
#tif.imsave('y_img.tif',y_test)
print(x_test.shape,y_test.shape)

model=load_model('all_metrics_cond_att_unet_single_dataset_3D_08_05.h5')
model.summary()

preds_test=model.predict(x_test)

preds_test_t=(preds_test>0.5).astype(np.uint8)
print("PREDICTION DONE!!!")
print(np.sum(preds_test_t))

#print(model.evaluate(x_test,y_test))

tif.imsave('paper_1.tif',preds_test_t*255)
print("OUPUTS SAVED")
