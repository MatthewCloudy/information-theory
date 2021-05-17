import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
from sklearn.decomposition import PCA

img = mpimg.imread("pic.png")

def compress(img, n_comps):
    img1 = np.reshape(img, (img.shape[0], img.shape[1]*img.shape[2]))
    pca = PCA(n_comps).fit(img1)
    img_pca = pca.transform(img1)
    img2 = pca.inverse_transform(img_pca) 
    img_compressed = np.reshape(img2, (img.shape[0], img.shape[1], img.shape[2]))
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

img_compressed, pca, img_pca = compress(img, 1)

plt.axis(False)
plt.imshow(img_compressed)

size_compare(img, img_compressed, pca, img_pca)