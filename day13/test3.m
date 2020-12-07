clear
clc
[audio_sig,audio_fs] = audioread('Audio_Pop01_15sec.wav');

L = length(audio_sig);
t = linspace(0,15,L);

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
[BPF1_n,BPF1_d] = butter(12,B_f1,'bandpass');
[BPF2_n,BPF2_d] = butter(12,B_f2,'bandpass');
[BPF3_n,BPF3_d] = butter(12,B_f3,'bandpass');
[HPF_n,HPF_d] = butter(10,H_f,'high');

audio_LPF = filter(LPF_n,LPF_d,audio_sig);
audio_BPF1 = filter(BPF1_n,BPF1_d,audio_sig);
audio_BPF2 = filter(BPF2_n,BPF2_d,audio_sig);
audio_BPF3 = filter(BPF3_n,BPF3_d,audio_sig);
audio_HPF = filter(HPF_n,HPF_d,audio_sig);

[audio_L_f0,audio_L_F] = myfun_SA(t,audio_LPF);
[audio_B1_f0,audio_B1_F] = myfun_SA(t,audio_BPF1);
[audio_B2_f0,audio_B2_F] = myfun_SA(t,audio_BPF2);
[audio_B3_f0,audio_B3_F] = myfun_SA(t,audio_BPF3);
[audio_H_f0,audio_H_F] = myfun_SA(t,audio_HPF);

c1 = 1;c2 = 5;c3 = 4;c4 = 2;c5 = 1;w = 1;
y0 = c1*audio_LPF + c2*audio_BPF1 + c3*audio_BPF2 + c4*audio_BPF3 + c5*audio_HPF;
x = audio_sig;

y0_s = sum(y0.^2);
x_s = sum(x.^2);
c0 = sqrt(x_s/y0_s);
y = c0 * w * y0;

[audio_f0,audio_F] = myfun_SA(t,audio_sig);
[y_f0,y_F] = myfun_SA(t,y);

figure(4)
subplot(5,2,1)
 plot(t,audio_LPF,'k')
 ylabel("Ch1 out, y2[n]")
 xlabel("Time [sec]")
 grid on

subplot(5,2,2)
plot(audio_L_f0,abs(audio_L_F),'k')
xlim([0,5000])
ylim([0 0.016])
xlabel("Frequency [Hz]")
 grid on
 
subplot(5,2,3)
 plot(t,audio_BPF1,'k')
  ylabel("Ch2 out, y3[n]")
 xlabel("Time [sec]")
 grid on
 
subplot(5,2,4)
plot(audio_B1_f0,abs(audio_B1_F),'k')
xlim([0,5000])
ylim([0 6*10^-3])
xlabel("Frequency [Hz]")
 grid on
 
subplot(5,2,5)
 plot(t,audio_BPF2,'k')
   ylabel("Ch3 out, y4[n]")
 xlabel("Time [sec]")
  ylim([-0.05,0.05])
 grid on
 
subplot(5,2,6)
plot(audio_B2_f0,abs(audio_B2_F),'k')
xlim([0,5000])
ylim([0 6*10^-4])
xlabel("Frequency [Hz]")
 grid on
 
subplot(5,2,7)
 plot(t,audio_BPF3,'k')
    ylabel("Ch4 out, y5[n]")
 xlabel("Time [sec]")
  ylim([-0.02,0.02])
 grid on
 
subplot(5,2,8)
plot(audio_B3_f0,abs(audio_B3_F),'k')
xlim([0,5000])
ylim([0 4*10^-4])
xlabel("Frequency [Hz]")
 grid on

subplot(5,2,9)
 plot(t,audio_HPF,'k')
    ylabel("Ch5 out, y1[n]")
 xlabel("Time [sec]")
 ylim([-0.02,0.02])
 grid on
 
subplot(5,2,10)
plot(audio_H_f0,abs(audio_H_F),'k')
xlim([0,5000])
ylim([0 4*10^-4])
xlabel("Frequency [Hz]")
 grid on

figure(5)
subplot(2,1,1)
plot(t,audio_sig,'r')
hold on
grid on
plot(t,y,'k')
sound(y,audio_fs)
ylim([-0.2,0.2])
xlabel("Time [sec]")
ylabel("Audio signal")
title("c1=1.0, c2=5.0, c3=4.0, c4=2.0, c5=1.0, w=1.0")
legend("Input","Output")

subplot(2,1,2)
plot(audio_f0,abs(audio_F),'r')
hold on
grid on
plot(y_f0,abs(y_F),'k')
xlabel("Frequency [Hz]")
ylabel("Magnitude spectrum")
ylim([0,0.015])
legend("Input","Output")
xlim([0,5000])

