clear
clc

img_Array = Loadimage('lena.raw',256,256);

figure(2) 

subplot(1,3,1)
imshow(img_Array);
xlabel('lena');

img_dct2 = dct2(img_Array);
image_norm = normalization(img_dct2);

subplot(1,3,2)
imshow(image_norm);
xlabel('lena DCT magnitude');

img_idct2 = uint8(idct2(img_dct2));

subplot(1,3,3)
imshow(img_idct2);
xlabel('lena IDCT');














