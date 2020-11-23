clear
clc

N = 5;
Rp = 10;
Rs = 30;
w = linspace(0,2,1000);

[LF_z,LF_p,k1] = buttap(N);
[C1F_z,C1F_p,k2] = cheb1ap(N,Rp);
[C2F_z,C2F_p,k3] = cheb2ap(N,Rs);
[ElF_z,ElF_p,k4] = ellipap(N,Rp,Rs);

[Hs_LF_n,Hs_LF_d] = zp2tf(LF_z,LF_p,k1);
[Hs_C1F_n,Hs_C1F_d] = zp2tf(C1F_z,C1F_p,k2);
[Hs_C2F_n,Hs_C2F_d] = zp2tf(C2F_z,C2F_p,k3);
[Hs_ElF_n,Hs_ElF_d] = zp2tf(ElF_z,ElF_p,k4);

Hs_LF = tf(Hs_LF_n,Hs_LF_d)
Hs_C1F = tf(Hs_C1F_n,Hs_C1F_d)
Hs_C2F = tf(Hs_C2F_n,Hs_C2F_d)
Hs_ElF = tf(Hs_ElF_n,Hs_ElF_d)
p = 1 ./ (w*i - C2F_p);
z = (w*i - C2F_z);
result = prod(p) .* prod(z).*k3;
Hw_LF = freqs(Hs_LF_n,Hs_LF_d,w);
Hw_C1F = freqs(Hs_C1F_n,Hs_C1F_d,w);
Hw_C2F = freqs(Hs_C2F_n,Hs_C2F_d,w);
Hw_ElF = freqs(Hs_ElF_n,Hs_ElF_d,w);
Hw_LFA = 10*log10((abs(Hw_LF)).^2);
Hw_C1FA = 10*log10((abs(Hw_C1F)).^2);
Hw_C2FA = 10*log10((abs(result)).^2);
Hw_ElFA = 10*log10((abs(Hw_ElF)).^2);

figure(1)
subplot(2,2,1)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'b--')
hold on;
grid on;
plot(LF_p,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1,1]);
set(gca,'Ytick',[-1:0.2:1])
xlabel('Real(s)');
ylabel('Image(s),Butterworth');
axis equal

subplot(2,2,2)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'b--')
hold on;
grid on;
plot(C1F_p,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1,1]);
set(gca,'Ytick',[-1:0.2:1])
xlabel('Real(s)');
ylabel('Image(s),Cheby shev-1');
axis equal

subplot(2,2,3)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'b--')
hold on;
grid on;
plot(C2F_z,'ko','MarkerSize',10,'LineWidth',1.3)
plot(C2F_p,'kx','MarkerSize',10,'LineWidth',1.3)
xlim([-2,2]);
ylim([-2,2]);
set(gca,'Ytick',[-2:0.5:2])
xlabel('Real(s)');
ylabel('Image(s),Cheby shev-2');
axis equal

subplot(2,2,4)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'b--')
hold on;
grid on;
plot(ElF_z,'ko','MarkerSize',10,'LineWidth',1.3)
plot(ElF_p,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1.5,1.5]);
set(gca,'Ytick',[-1.5:0.5:1.5])
xlabel('Real(s)');
ylabel('Image(s),Elliptic');
axis equal

figure(2)
subplot(2,2,1)
plot(w,Hw_LFA,'k','LineWidth',1.5)
xlim([0,2]);
ylim([-40,5]);
set(gca,'Xtick',[0:0.5:2]);
set(gca,'Ytick',[-40:5:5]);
xlabel('Frequency \omega[rad/sec]');
ylabel('|H(w)|^2[dB],Butterworth');
grid on;

subplot(2,2,2)
plot(w,Hw_C1FA,'k','LineWidth',1.5)
xlim([0,2]);
ylim([-70,5]);
set(gca,'Ytick',[-70:10:5])
set(gca,'Xtick',[0:0.5:2]);
xlabel('Frequency \omega[rad/sec]');
ylabel('|H(w)|^2[dB],Chebyshev Type-1');
grid on;

subplot(2,2,3)
plot(w,Hw_C2FA,'k','LineWidth',1.5)
xlim([0,2]);
ylim([-70,5]);
set(gca,'Ytick',[-70:10:5])
set(gca,'Xtick',[0:0.5:2]);
xlabel('Frequency \omega[rad/sec]');
ylabel('|H(w)|^2[dB],Chebyshev Type-2');
grid on;

subplot(2,2,4)
plot(w,Hw_ElFA,'k','LineWidth',1.5)
xlim([0,2]);
ylim([-70,5]);
set(gca,'Ytick',[-70:10:5])
set(gca,'Xtick',[0:0.5:2]);
xlabel('Frequency \omega[rad/sec]');
ylabel('|H(w)|^2[dB],Elliptic');
grid on;
