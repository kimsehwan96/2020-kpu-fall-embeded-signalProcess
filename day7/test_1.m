N = 50;
f0 = 0.1;
n = linspace(0,N-1,N);
x_n = cos(2*pi*f0*n);

[fhat,xk,mult] = nDFT(x_n,N);
xk_f_hat = xk;

subplot(2,1,1)
stem(n,x_n,'k','LineWidth',1,'MarkerFaceColor','k');
xlabel('n');
ylabel('x[n]');
grid on

subplot(2,1,2)
stem(fhat,abs(xk_f_hat),'k','LineWidth',1,'MarkerFaceColor','k');
xlabel('f_{hat}');
ylabel('|X[k]|');
grid on

str = sprintf('Count of Multiplications = %d\n',mult);
fprintf(str);

