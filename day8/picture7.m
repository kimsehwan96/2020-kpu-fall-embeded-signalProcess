clear
clc

N = 64;
n = linspace(0,N-1,N);
f = 0.1;
x_n = cos(2*pi*f*n);

[f_hat,Xk] = nFFT(x_n,N);

Xk_f_hat = circshift(Xk,N/2);

figure(1)
subplot(2,1,1)
stem(n,x_n,'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
xlim([0 63]);
grid on

subplot(2,1,2)
stem(f_hat,abs(Xk_f_hat),'k','LineWidth',0.8,'MarkerFaceColor','k');
xlabel('f_h_a_t');
ylabel('|X[k]|');
grid on
