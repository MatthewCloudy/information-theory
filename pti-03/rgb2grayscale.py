import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
from sklearn.decomposition import PCA

img = mpimg.imread("pic.png")

def compress(img, n_comps):
    img1 = np.reshape(img, (img.shape[0] * img.shape[1], img.shape[2]), 'F')
    pca = PCA(n_comps).fit(img1)
    img_pca = pca.transform(img1)
    img2 = pca.inverse_transform(img_pca) 
    img_compressed = np.reshape(img2, (img.shape[0], img.shape[1], img.shape[2]), 'F')
    return img_compressed, pca, img_pca

def size_compare(img, img_compressed, pca, img_pca):
    
    original_size = img.shape[0] * img.shape[1] * img.shape[2]
    compressed_size = img_pca.shape[0] * img_pca.shape[1] + pca.components_.shape[0] * pca.components_.shape[1]
    
    print("Original size: ")
    print(original_size)
    print("Compressed size: ")
    print(compressed_size)
    print("\nCompressed image ratio to original: ")
    print(compressed_size / original_size)

def convert_to_greyscale(img):
    grey_img = np.zeros((img.shape[0], img.shape[1]))
    for x in range(img.shape[0]):
        for y in range(img.shape[1]):
            grey_img[x,y] = 0
            for z in range(img.shape[2]):
                if img[x,y,z] <= 0.04045:
                    img[x,y,z] /= 12.92
                else:
                    img[x,y,z] = ((img[x,y,z] + 0.055)/1.055)**2.4
                if z == 0:
                    img[x,y,z] *= 0.2126
                elif z == 1:
                    img[x,y,z] *= 0.7152
                else:
                    img[x,y,z] *= 0.0722
                grey_img[x,y] += img[x,y,z]
            if grey_img[x,y] <= 0.0031308:
                grey_img[x,y] *= 12.92
            else:
                grey_img[x,y] = 1.055*(grey_img[x,y]**(1/2.4)) - 0.055

    return grey_img

img_compressed, pca, img_pca = compress(img, 1)
grey_img = convert_to_greyscale(img_compressed)
grey = np.dstack((grey_img, grey_img, grey_img))

plt.axis(False)
plt.imshow(grey)

#grey_img_orig = convert_to_greyscale(img)
#grey_orig = np.dstack((grey_img_orig, grey_img_orig, grey_img_orig))

#plt.axis(False)
#plt.imshow(grey_orig)

size_compare(img, grey_img, pca, img_pca)