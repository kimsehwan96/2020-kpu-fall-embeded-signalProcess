clc
clear

N = 7; %7차 butterworth 필터의 차수 정의
fs = 50000; % 표본화주파수 50,000hz
f = linspace(0,5500,110000); %주파수 범위 정의
f_o = f*2*pi;
[LF_z,LF_p,LF_k] = buttap(N); %7차 butterworth필터 정의
[LF_n,LF_d] = zp2tf(LF_z,LF_p,LF_k); %zero, pole로부터 전달함수 변환

%low pass filter로부터 bandpass filter로 전환 
[BPF_A_n,BPF_A_d] = lp2bp(LF_n,LF_d,3000*2*pi,2000*2*pi); 
%low pass filter로부터 high pass filter로 전환 
[HPF_A_n,HPF_A_d] = lp2hp(LF_n,LF_d,4000*2*pi);

%위에서 구한 BPF, HPF를 이산화,
[BPF_D_n,BPF_D_d] = bilinear(BPF_A_n,BPF_A_d,fs);
[HPF_D_n,HPF_D_d] = bilinear(HPF_A_n,HPF_A_d,fs);

%s 도메인 (아날로그 필터, s도메인의 전달함수)에 대한 주파수 응답
BPF_A = freqs(BPF_A_n,BPF_A_d,f*2*pi);
HPF_A = freqs(HPF_A_n,HPF_A_d,f*2*pi);

%z 도메인 (이산화된 디지털 시스템의 전달함수를 이용한 주파수 응답)
BPF_D = freqz(BPF_D_n,BPF_D_d,f_o/fs);
HPF_D = freqz(HPF_D_n,HPF_D_d,f_o/fs);

figure(4)
plot(f,abs(BPF_A),'b','LineWidth',1.5)
hold on
grid on
plot(f,abs(BPF_D),'g','LineWidth',1.5)
plot(f,abs(HPF_A),'r','LineWidth',1.5)
plot(f,abs(HPF_D),'c','LineWidth',1.5)
xlim([1500,5500]);
ylim([0,1.4]);
xlabel("Frequency, f[Hz]");
ylabel("|H(f)|");
legend("Analog BPF","Digital BPF","Analog HPF","Digital HPF");

%figure 4
% 각 BPF및 HPF의 주파수 응답 및 이산화된 디지털 시스템의 주파수 응답
% 아날로그 필터의 주파수 응답과 거의 일치한다.
% 표본화 주파수가 높아질수록 아날로그 필터의 응답과 오차가 줄어든다.


