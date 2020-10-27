N = 1024;
n = linspace(0,N-1,N);

x_n1 = [zeros(1,1)+1,zeros(1,N-1)];
x_n2 = [zeros(1,10)+1,zeros(1,N-10)];
x_n3 = [zeros(1,30)+1,zeros(1,N-30)];
x_n4 = [zeros(1,50)+1,zeros(1,N-50)];

[f_hat1,Xk1,N_mult1] = nDFT(x_n1,N);
xk_f_hat1 = circshift(Xk1,N/2);

[f_hat2,Xk2,N_mult2] = nDFT(x_n2,N);
xk_f_hat2 = circshift(Xk2,N/2);

[f_hat3,Xk3,N_mult3] = nDFT(x_n3,N);
xk_f_hat3 = circshift(Xk3,N/2);

[f_hat4,Xk4,N_mult4] = nDFT(x_n4,N);
xk_f_hat4 = circshift(Xk4,N/2);

N1 = 50;
n1 = linspace(0,N1-1,N1);

x_na = [zeros(1,1)+1,zeros(1,N1-1)];
x_nb = [zeros(1,10)+1,zeros(1,N1-10)];
x_nc = [zeros(1,30)+1,zeros(1,N1-30)];
x_nd = [zeros(1,50)+1,zeros(1,N1-50)];

[f_hata,Xka,N_multa] = nDFT(x_na,N1);
xk_f_hata = circshift(Xka,N1/2);

[f_hatb,Xkb,N_multb] = nDFT(x_nb,N1);
xk_f_hatb = circshift(Xkb,N1/2);

[f_hatc,Xkc,N_multc] = nDFT(x_nc,N1);
xk_f_hatc = circshift(Xkc,N1/2);

[f_hatd,Xkd,N_multd] = nDFT(x_nd,N1);
xk_f_hatd = circshift(Xkd,N1/2);

figure(3)

subplot(4,2,1)
stem(n1,x_na,'k','LineWidth',1,'MarkerFaceColor','k');
grid on
ylabel('x[n]');
xlabel('n');

subplot(4,2,3)
stem(n1,x_nb,'k','LineWidth',1,'MarkerFaceColor','k');
grid on
ylabel('x[n]');
xlabel('n');

subplot(4,2,5)
stem(n1,x_nc,'k','LineWidth',1,'MarkerFaceColor','k');
grid on
ylabel('x[n]');
xlabel('n');

subplot(4,2,7)
stem(n1,x_nd,'k','LineWidth',1,'MarkerFaceColor','k');
grid on
ylabel('x[n]');
xlabel('n');

subplot(4,2,2)
plot(f_hat1,abs(xk_f_hat1),'k','LineWidth',1);
hold on
grid on
stem(f_hata,abs(xk_f_hata),'ro');
legend('DTFT','DFT');
ylim([0,2]);
ylabel('|Xk|');
xlabel('f_{hat}');

subplot(4,2,4)
plot(f_hat2,abs(xk_f_hat2),'k','LineWidth',1);
hold on
grid on
stem(f_hatb,abs(xk_f_hatb),'ro');
legend('DTFT','DFT');
ylabel('|Xk|');
xlabel('f_{hat}');


subplot(4,2,6)
plot(f_hat3,abs(xk_f_hat3),'k','LineWidth',1);
hold on
grid on
stem(f_hatc,abs(xk_f_hatc),'ro');
legend('DTFT','DFT');
ylabel('|Xk|');
xlabel('f_{hat}');


subplot(4,2,8)
plot(f_hat4,abs(xk_f_hat4),'k','LineWidth',1);
hold on
grid on
stem(f_hatd,abs(xk_f_hatd),'ro');
legend('DTFT','DFT');
ylabel('|Xk|');
xlabel('f_{hat}');

% wrong test