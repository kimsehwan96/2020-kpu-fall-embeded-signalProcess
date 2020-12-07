clear
clc
theta = linspace(0,2*pi);
x = cos(theta);                      
y = sin(theta);

%오디오 신호 읽기
[audio_sig,audio_fs] = audioread('Audio_Pop01_15sec.wav');

%오디오 신호의 sampling time
fs = audio_fs;
%주기는 1/fs
Ts = 1/fs;

f = linspace(0,5000,10000);

W = (f*2*pi)/fs;

%LPF의 cutoff 주파수
L_f = 500/(fs/2);
%BPF는 두개의 벡터를 제공해야 함.
B_f1 = [500/(fs/2),1500/(fs/2)];
B_f2 = [1500/(fs/2) 2500/(fs/2)];
B_f3 = [2500/(fs/2) 3500/(fs/2)];

%HPF의 cutoff 주파수
H_f = 3500/(fs/2);

%butter는 APF -> bilinear tf 까지 한번에 수행함.
%7차, PLF
[LPF_n,LPF_d] = butter(7,L_f,'low');
%6차, BPF
[BPF1_n,BPF1_d] = butter(6,B_f1,'bandpass');
[BPF2_n,BPF2_d] = butter(6,B_f2,'bandpass');
[BPF3_n,BPF3_d] = butter(6,B_f3,'bandpass');
%10차 HPF
[HPF_n,HPF_d] = butter(10,H_f,'high');

%전달함수를 통해 zero pole check
[LPF_z,LPF_p,~] = tf2zp(LPF_n,LPF_d);
[BPF1_z,BPF1_p,~] = tf2zp(BPF1_n,BPF1_d);
[BPF2_z,BPF2_p,~] = tf2zp(BPF2_n,BPF2_d);
[BPF3_z,BPF3_p,~] = tf2zp(BPF3_n,BPF3_d);
[HPF_z,HPF_p,~] = tf2zp(HPF_n,HPF_d);

%각 디지털 필터를 통과했을 때의 주파수 도메인에서의 스펙트럼 분석
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





