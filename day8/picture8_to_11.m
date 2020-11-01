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

[~,Xkd1] = nDFT(xn1,N1);
[f_hat1,Xkf1] = nFFT(xn1,N1);
[~,Xkd2] = nDFT(xn2,N2);
[f_hat2,Xkf2] = nFFT(xn2,N2);
[~,Xkd3] = nDFT(xn3,N3);
[f_hat3,Xkf3] = nFFT(xn3,N3);
[~,Xkd4] = nDFT(xn4,N4);
[f_hat4,Xkf4] = nFFT(xn4,N4);

Xkd1_f_hat = circshift(Xkd1,N1/2);
Xkf1_f_hat = circshift(Xkf1,N1/2);
Xkd2_f_hat = circshift(Xkd2,N2/2);
Xkf2_f_hat = circshift(Xkf2,N2/2);
Xkd3_f_hat = circshift(Xkd3,N3/2);
Xkf3_f_hat = circshift(Xkf3,N3/2);
Xkd4_f_hat = circshift(Xkd4,N4/2);
Xkf4_f_hat = circshift(Xkf4,N4/2);

figure(2)
subplot(2,1,1)
stem(n1,xn1,'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
xlim([0 N1-1]);
ylim([-2 2]);
grid on

subplot(2,1,2)
plot(f_hat1,abs(Xkd1_f_hat),'k:o','LineWidth',1);
hold on;
plot(f_hat1,abs(Xkf1_f_hat),'r:x','LineWidth',1);
xlabel('f_h_a_t N=16');
ylabel('|X[k]|');
legend('DFT','FFT');
grid on


figure(3)
subplot(2,1,1)
stem(n2,xn2,'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
xlim([0 N2-1]);
ylim([-2 2]);
grid on

subplot(2,1,2)
plot(f_hat2,abs(Xkd2_f_hat),'k:o','LineWidth',1);
hold on;
plot(f_hat2,abs(Xkf2_f_hat),'r:x','LineWidth',1);
xlabel('f_h_a_t N=32');
ylabel('|X[k]|');
legend('DFT','FFT');
grid on


figure(4)
subplot(2,1,1)
stem(n3,xn3,'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
xlim([0 N3-1]);
ylim([-2 2]);
grid on

subplot(2,1,2)
plot(f_hat3,abs(Xkd3_f_hat),'k:o','LineWidth',1);
hold on;
plot(f_hat3,abs(Xkf3_f_hat),'r:x','LineWidth',1);
xlabel('f_h_a_t N=64');
ylabel('|X[k]|');
legend('DFT','FFT');
grid on


figure(5)
subplot(2,1,1)
stem(n4,xn4,'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
xlim([0 N4-1]);
ylim([-2 2]);
grid on

subplot(2,1,2)
plot(f_hat4,abs(Xkd4_f_hat),'k:o','LineWidth',1);
hold on;
plot(f_hat4,abs(Xkf4_f_hat),'r:x','LineWidth',1);
xlabel('f_h_a_t N=128');
ylabel('|X[k]|');
legend('DFT','FFT');
grid on



