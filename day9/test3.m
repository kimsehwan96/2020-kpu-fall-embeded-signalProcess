clear
clc
img_Array = Loadimage('lena.raw',256,256);

img_dct2 = dct2(img_Array);
img_norm = normalization(img_dct2);

th0 = 0.001;
th1 = 0.01;
th2 = 0.1;
th3 = 0.25;
th4 = 0.5;

img_norm_th0 = img_norm;
img_norm_th1 = img_norm;
img_norm_th2 = img_norm;
img_norm_th3 = img_norm;
img_norm_th4 = img_norm;

img_dct2_th0 = img_dct2;
img_dct2_th1 = img_dct2;
img_dct2_th2 = img_dct2;
img_dct2_th3 = img_dct2;
img_dct2_th4 = img_dct2;

img_norm_th0(img_norm_th1 < th0) = 0;
img_norm_th1(img_norm_th1 < th1) = 0;
img_norm_th2(img_norm_th2 < th2) = 0;
img_norm_th3(img_norm_th3 < th3) = 0;
img_norm_th4(img_norm_th4 < th4) = 0;

img_index0 = (img_norm_th0 == 0);
img_index1 = (img_norm_th1 == 0);
img_index2 = (img_norm_th2 == 0);
img_index3 = (img_norm_th3 == 0);
img_index4 = (img_norm_th4 == 0);

figure(3)

subplot(2,4,1)
imshow(img_norm_th1);
xlabel('ena DCT magnitude, Th = 0.01');

subplot(2,4,2)
imshow(img_norm_th2);
xlabel('lena DCT magnitude, Th = 0.1');

subplot(2,4,5)
imshow(img_norm_th3);
xlabel('lena DCT magnitude, Th = 0.25');

subplot(2,4,6)
imshow(img_norm_th4);
xlabel('lena DCT magnitude, Th = 0.5');

img_dct2_th0(img_index0) = 0;
img_dct2_th1(img_index1) = 0;
img_dct2_th2(img_index2) = 0;
img_dct2_th3(img_index3) = 0;
img_dct2_th4(img_index4) = 0;

subplot(2,4,3)
imshow(uint8(idct2(img_dct2_th1)));
xlabel('lena IDCT, Th = 0.01');

subplot(2,4,4)
imshow(uint8(idct2(img_dct2_th2)));
xlabel('lena IDCT, Th = 0.1');

subplot(2,4,7)
imshow(uint8(idct2(img_dct2_th3)));
xlabel('lena IDCT, Th = 0.25');

subplot(2,4,8)
imshow(uint8(idct2(img_dct2_th4)));
xlabel('lena IDCT, Th = 0.5');
