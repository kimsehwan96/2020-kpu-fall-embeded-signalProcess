clear
clc

syms x;
w = linspace(0,2.5,1000);
f = linspace(0,5000,1000);
w2 = linspace(0,5000*2*pi,1000);
Ps = 10*log10(x) == -40;
ps = solve(Ps,x);
d_w = 1;
N = ceil(log10((1/ps)-1)/(2*log10(1+d_w)));
N = double(N);

[LF_z,LF_p,k] = buttap(N);
[Hs_LF_n,Hs_LF_d] = zp2tf(LF_z,LF_p,k);
Hw_LF = 10*log10((abs(freqs(Hs_LF_n,Hs_LF_d,w))).^2);

[LF_n,LF_d] = lp2lp(Hs_LF_n,Hs_LF_d,300);
[BPF1_n,BPF1_d] = lp2bp(Hs_LF_n,Hs_LF_d,650,700);
[BPF2_n,BPF2_d] = lp2bp(Hs_LF_n,Hs_LF_d,1500,1000);
[BPF3_n,BPF3_d] = lp2bp(Hs_LF_n,Hs_LF_d,3000,2000);
[HF_n,HF_d] = lp2hp(Hs_LF_n,Hs_LF_d,4000);

LF = 10*log10((abs(freqs(LF_n,LF_d,f))).^2);
BPF1 = 10*log10((abs(freqs(BPF1_n,BPF1_d,f))).^2);
BPF2 = 10*log10((abs(freqs(BPF2_n,BPF2_d,f))).^2);
BPF3 = 10*log10((abs(freqs(BPF3_n,BPF3_d,f))).^2);
HF = 10*log10((abs(freqs(HF_n,HF_d,f))).^2);


figure(3)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'b--')
hold on;
grid on;
plot(LF_p,'kx','MarkerSize',10,'LineWidth',1.5)
ylim([-1,1]);
set(gca,'Ytick',[-1:0.2:1])
xlabel("Real(s)");
ylabel("Image(s),Butterworth");
axis equal

figure(4)
plot(w,Hw_LF,'k','LineWidth',1.5)
xlim([0,2.5]);
ylim([-50,5]);
set(gca,'Xtick',[0:0.5:2.5]);
set(gca,'Ytick',[-50:5:5]);
xlabel("Frequency \omega[rad/sec]");
ylabel("|H(w)|^2[dB],Butterworth");
grid on;

figure(5)
plot(f,LF,'b','LineWidth',1.5)
hold on;
plot(f,BPF1,'g','LineWidth',1.5)
plot(f,BPF2,'r','LineWidth',1.5)
plot(f,BPF3,'c','LineWidth',1.5)
plot(f,HF,'m','LineWidth',1.5)
ylim([-30,10]);
xlim([0,5000]);
xlabel("Frequency,[Hz]");
ylabel("|H(w)|^2[dB]");
legend("Filter 1, LPF","Filter 2, BPF","Filter 3, BPF","Filter 4, BPF","Filter 5, HPF");
grid on;

