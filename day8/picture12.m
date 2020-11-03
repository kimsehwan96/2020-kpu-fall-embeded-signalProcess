clear
clc

N1 = 16;
N2 = 32;
N3 = 64;
N4 = 128;

n1 = linspace(0,N1-1,N1);
n2 = linspace(0,N2-1,N2);
n3 = linspace(0,N3-1,N3);
n4 = linspace(0,N4-1,N4);

f1 = 0.1;
f2 = 0.3;

xn1 = 0.3*cos(2*pi*f1*n1) + 0.8*sin(2*pi*f2*n1);
xn2 = 0.3*cos(2*pi*f1*n2) + 0.8*sin(2*pi*f2*n2);
xn3 = 0.3*cos(2*pi*f1*n3) + 0.8*sin(2*pi*f2*n3);
xn4 = 0.3*cos(2*pi*f1*n4) + 0.8*sin(2*pi*f2*n4);

[~,Xkd1,Md1] = nDFT(xn1,N1);
[f_hat1,Xkf1,Mf1] = nFFT(xn1,N1);
[~,Xkd2,Md2] = nDFT(xn2,N2);
[f_hat2,Xkf2,Mf2] = nFFT(xn2,N2);
[~,Xkd3,Md3] = nDFT(xn3,N3);
[f_hat3,Xkf3,Mf3] = nFFT(xn3,N3);
[~,Xkd4,Md4] = nDFT(xn4,N4);
[f_hat4,Xkf4,Mf4] = nFFT(xn4,N4);

Md = [Md1 Md2 Md3 Md4];
Mf = [Mf1 Mf2 Mf3 Mf4];
N = [16 32 64 128];

figure(6)
subplot(2,1,1)
semilogy(N,Md,'o-b','LineWidth',1);
hold on;
semilogy(N,Mf,'^-g','LineWidth',1);
grid on;
ylim([10,10^5]);
legend('DFT','FFT');
xlabel('N');
ylabel('Number of multiplications');

subplot(2,1,2)
plot(N,(Mf./Md),'o-k','LineWidth',1);
grid on;
ylim([0.02,0.14]);
xlabel('N');
ylabel('Ratio of FFT computations over DFT');