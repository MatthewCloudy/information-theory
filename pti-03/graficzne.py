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
    for x in img:
        if x <= 0.04045:
            x = x/12.92
        else:
            x = ((x + 0.055)/1.055)**2.4
    
    grey_img = np.multiply(0.2126, img[0]) + np.multiply(0.7152, img[1]) + np.multiply(0.0722, img[2])
    for x in grey_img:
        if x <= 0.0031308:
            x = x*12.92
        else:
            x = 1.055*(x**(1/2.4)) - 0.055

    return grey_img

img_compressed, pca, img_pca = compress(img, 1)

plt.axis(False)
plt.imshow(img_compressed)

size_compare(img, img_compressed, pca, img_pca)