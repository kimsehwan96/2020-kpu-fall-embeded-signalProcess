clear
clc

img_Array = Loadimage('lena.raw',256,256);

subplot(1,3,1)
imshow(img_Array);
xlabel('lena');

img_fft2 = fft2(img_Array);
image_norm = normalization(img_fft2);

figure(1)

subplot(1,3,2)
imshow(image_norm);
xlabel('lena FFT magnitude');

img_ifft2 = uint8(ifft2(img_fft2));

subplot(1,3,3)
imshow(img_ifft2);
xlabel('lena IFFT');














