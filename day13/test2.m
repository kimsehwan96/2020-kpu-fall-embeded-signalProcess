clear
clc
theta = linspace(0,2*pi);
x = cos(theta);                      
y = sin(theta);

[audio_sig,audio_fs] = audioread('Audio_Pop01_15sec.wav');

fs = audio_fs;
Ts = 1/fs;
f = linspace(0,5000,10000);
W = (f*2*pi)/fs;

L_f = 500/(fs/2);
B_f1 = [500/(fs/2),1500/(fs/2)];
B_f2 = [1500/(fs/2) 2500/(fs/2)];
B_f3 = [2500/(fs/2) 3500/(fs/2)];
H_f = 3500/(fs/2);

[LPF_n,LPF_d] = butter(7,L_f,'low');
[BPF1_n,BPF1_d] = butter(6,B_f1,'bandpass');
[BPF2_n,BPF2_d] = butter(6,B_f2,'bandpass');
[BPF3_n,BPF3_d] = butter(6,B_f3,'bandpass');
[HPF_n,HPF_d] = butter(10,H_f,'high');

[LPF_z,LPF_p,~] = tf2zp(LPF_n,LPF_d);
[BPF1_z,BPF1_p,~] = tf2zp(BPF1_n,BPF1_d);
[BPF2_z,BPF2_p,~] = tf2zp(BPF2_n,BPF2_d);
[BPF3_z,BPF3_p,~] = tf2zp(BPF3_n,BPF3_d);
[HPF_z,HPF_p,~] = tf2zp(HPF_n,HPF_d);

LPF = freqz(LPF_n,LPF_d,W);
BPF1 = freqz(BPF1_n,BPF1_d,W);
BPF2 = freqz(BPF2_n,BPF2_d,W);
BPF3 = freqz(BPF3_n,BPF3_d,W);
HPF = freqz(HPF_n,HPF_d,W);

figure(2)
plot(f,abs(LPF),'b','LineWidth',1.5)
hold on
grid on
plot(f,abs(BPF1),'g','LineWidth',1.5)
plot(f,abs(BPF2),'r','LineWidth',1.5)
plot(f,abs(BPF3),'c','LineWidth',1.5)
plot(f,abs(HPF),'m','LineWidth',1.5)
xlabel("Frequency [Hz]")
ylabel("Frequency response, |H(f)|")
legend("Channel1 filter","Channel2 filter","Channel3 filter","Channel4 filter","Channel5 filter")

figure(3)
subplot(3,2,1)
plot(x,y,'b--')
hold on
grid on
plot(LPF_z,'go','MarkerSize',10,'LineWidth',1.3)
plot(LPF_p,'rx','MarkerSize',10,'LineWidth',1.3)
xlabel("Ch1 filter")
xlim([-1,1])
ylim([-1,1])
set(gca,'Xtick',[-1:0.5:1])
axis equal;

subplot(3,2,2)
plot(x,y,'b--')
hold on
grid on
plot(BPF1_z,'go','MarkerSize',10,'LineWidth',1.3)
plot(BPF1_p,'rx','MarkerSize',10,'LineWidth',1.3)
xlabel("Ch2 filter")
xlim([-1,1])
ylim([-1,1])
set(gca,'Xtick',[-1:0.5:1])
axis equal;

subplot(3,2,3)
plot(x,y,'b--')
hold on
grid on
plot(BPF2_z,'go','MarkerSize',10,'LineWidth',1.3)
plot(BPF2_p,'rx','MarkerSize',10,'LineWidth',1.3)
xlabel("Ch3 filter")
xlim([-1,1])
ylim([-1,1])
set(gca,'Xtick',[-1:0.5:1])
axis equal;

subplot(3,2,4)
plot(x,y,'b--')
hold on
grid on
plot(BPF3_z,'go','MarkerSize',10,'LineWidth',1.3)
plot(BPF3_p,'rx','MarkerSize',10,'LineWidth',1.3)
xlabel("Ch4 filter")
xlim([-1,1])
ylim([-1,1])
set(gca,'Xtick',[-1:0.5:1])
axis equal;

subplot(3,2,5)
plot(x,y,'b--')
hold on
grid on
plot(HPF_z,'go','MarkerSize',10,'LineWidth',1.3)
plot(HPF_p,'rx','MarkerSize',10,'LineWidth',1.3)
xlabel("Ch5 filter")
xlim([-1,1])
ylim([-1,1])
set(gca,'Xtick',[-1:0.5:1])
axis equal;





