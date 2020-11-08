clear
clc

img_Array = Loadimage('lena.raw',256,256);

img_dct2 = dct2(img_Array);
img_norm = normalization(img_dct2);

th0 = 0.001;
th1 = 0.01;
th2 = 0.05;
th3 = 0.1;
th4 = 0.25;
th5 = 0.5;

img_norm_th0 = img_norm;
img_norm_th1 = img_norm;
img_norm_th2 = img_norm;
img_norm_th3 = img_norm;
img_norm_th4 = img_norm;
img_norm_th5 = img_norm;

img_dct2_th0 = img_dct2;
img_dct2_th1 = img_dct2;
img_dct2_th2 = img_dct2;
img_dct2_th3 = img_dct2;
img_dct2_th4 = img_dct2;
img_dct2_th5 = img_dct2;

img_norm_th0(img_norm_th1 < th0) = 0;
img_norm_th1(img_norm_th1 < th1) = 0;
img_norm_th2(img_norm_th2 < th2) = 0;
img_norm_th3(img_norm_th3 < th3) = 0;
img_norm_th4(img_norm_th4 < th4) = 0;
img_norm_th5(img_norm_th5 < th5) = 0;

img_index0 = (img_norm_th0 == 0);
img_index1 = (img_norm_th1 == 0);
img_index2 = (img_norm_th2 == 0);
img_index3 = (img_norm_th3 == 0);
img_index4 = (img_norm_th4 == 0);
img_index5 = (img_norm_th5 == 0);

img_dct2_th0(img_index0) = 0;
img_dct2_th1(img_index1) = 0;
img_dct2_th2(img_index2) = 0;
img_dct2_th3(img_index3) = 0;
img_dct2_th4(img_index4) = 0;
img_dct2_th5(img_index5) = 0;

default_num = 256*256;
num_ref = numel(find(abs(img_dct2) < 0.001));
comp_ref = default_num - num_ref;

num0 = numel(find(img_dct2_th0 == 0));
comp0 = default_num - num0;
num1 = numel(find(img_dct2_th1 == 0));
comp1 = default_num - num1;
num2 = numel(find(img_dct2_th2 == 0));
comp2 = default_num - num2;
num3 = numel(find(img_dct2_th3 == 0));
comp3 = default_num - num3;
num4 = numel(find(img_dct2_th4 == 0));
comp4 = default_num - num4;
num5 = numel(find(img_dct2_th5 == 0));
comp5 = default_num - num5;

comp_ratio = [(comp0/comp_ref) (comp1/comp_ref) (comp2/comp_ref) (comp3/comp_ref) (comp4/comp_ref) (comp5/comp_ref)];
th = [th0 th1 th2 th3 th4 th5];

figure(4)
semilogy(th,comp_ratio,'o-r','LineWidth',0.8);
xlabel('Threshold');
ylabel('Compression Ratio');
ylim([10^-3,1]);
grid on;

RMSE0 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th0)))).^2)))/default_num);
RMSE1 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th1)))).^2)))/default_num);
RMSE2 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th2)))).^2)))/default_num);
RMSE3 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th3)))).^2)))/default_num);
RMSE4 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th4)))).^2)))/default_num);
RMSE5 = sqrt((sum(sum((abs(img_Array - uint8(idct2(img_dct2_th5)))).^2)))/default_num);

RMSE = [RMSE0 RMSE1 RMSE2 RMSE3 RMSE4 RMSE5];
 
figure(5)
plot(th,RMSE,'s-b','LineWidth',0.8);
xlabel('Threshold');
ylabel('RMSE');
grid on;
