import cv2 
import numpy as np

image = cv2.imread('/home/ahsan/Downloads/photo-of-tabby-cat-3777622.jpg',0)

kernel = np.array([[0,-1,0],[-1,4,-1],[0,-1,0]])

image=cv2.resize(image,(500,500),interpolation=cv2.INTER_AREA)

# kernel = kernel*1/9

height,width =np.shape(image)

new_image =np.zeros((height,width))
pad_size =1

for i in range(0,width-1):
    for j in range(0,height-1):
            sum_1=0
            for s in range(-pad_size,pad_size+1):
                for t in range(-pad_size,pad_size+1):
                    x=s+i
                    y=j+t
                    sum_1+=kernel[s,t]*image[x,y]
            new_image[i,j]=np.uint8(sum_1)
# np.asarray(new_image,dtype=np.uint8)
print(new_image.astype(np.uint8))

cv2.imshow('Original',image)
cv2.imshow('New Image',new_image.astype(np.uint8))
cv2.waitKey(0)