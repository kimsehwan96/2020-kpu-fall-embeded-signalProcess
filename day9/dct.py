import sys
import numpy as np
import matplotlib.pyplot as plt
import copy
from math import cos, sqrt, pi
from scipy.fftpack import dctn, idctn

def dct_type2(x, y, u, v, n):
    def alpha(a):
        if a==0:
            return sqrt(1.0/n)
        else:
            return sqrt(2.0/n)
    return alpha(u) * alpha(v) * cos(((2*x+1)*(u*pi))/(2*n)) * cos(((2*y+1)*(v*pi))/(2*n)) #u와 v는 n1, n2와 같이 원레 데이터의  , n은 N1, N2 (아마 크기? 8이나 256같은?) x, y는 변환된 값의 인덱스?
    #직접 구현해서 써보려고 했는데 이건 나중에 다시 건들여보자..

def process_dct(width, height, bitResoulution, image):
    processed_image = copy.deepcopy(image)
    for y in range(0, width):
        for x in range(0, height):
            processed_image[y, x] = dct_type2(x, y, width, height, bitResoulution) #256 * 256 일경우 256
    return processed_image



with open('lena.raw','rb') as f: #raw 이미지를 rb (바이너리로 읽기)모드로 열어야 함.
    height = 256 #pixels
    width = 256 #pixels
    bin_image = np.frombuffer(f.read(), dtype=np.uint8) #디코딩 nono, binary data.
    bin_image.shape = (height, width) # 각 행은 256개의 데이터을(Gray)갖고있고 총 256개 열
    plt.imshow(bin_image, cmap='gray') #color map은 gray임.
    plt.show(block=True) #이미지가 보임.
    #after_img = copy.deepcopy(bin_image)
    after_img = dctn(copy.deepcopy(bin_image), norm="ortho", type=2)
    plt.imshow(after_img, cmap='gray') #color map은 gray임.
    plt.show(block=True) #이미지가 보임.
    reverse_img = idctn(after_img, norm="ortho", type=2)
    plt.imshow(reverse_img, cmap='gray')
    plt.show(block=True)