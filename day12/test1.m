clc
clear

theta = linspace(0,2*pi); %주파수 영역 범위
x = cos(theta);  %단위원을 위한 x
y = sin(theta);

Hs_n = 1; %butterworth LPF의 분자요소
Hs_d = [1 2 2 1]; %butterworth LPF의 분모 요소
fs_1 = 5; %sampling time 5hz
fs_2 = 10; %sampling time 10 hz
w = linspace(0,2,1000); %
W = linspace(0,2*pi,1000); %주파수 응답을 확인하기 위한 범위

[Hz_n_f1,Hz_d_f1] = bilinear(Hs_n,Hs_d,fs_1); %bilinear(num, den, fs)
[Hz_n_f2,Hz_d_f2] = bilinear(Hs_n,Hs_d,fs_2); %아날로그 시스템의 전달함수를 이산화 함
%5, 10hz로 각각 이산화 함

Hz_f1 = tf(Hz_n_f1,Hz_d_f1) %이산화된 전달함수
Hz_f2 = tf(Hz_n_f2,Hz_d_f2) %이산화된 전달함수

[z_s,p_s,k1] = tf2zp(Hs_n,Hs_d); %전달함수로부터 pole, zero 구하기
[z_f1,p_f1,k2] = tf2zp(Hz_n_f1,Hz_d_f1); %전달함수로부터 pole, zero 구하기
[z_f2,p_f2,k3] = tf2zp(Hz_n_f2,Hz_d_f2); %전달함수로부터 pole, zero 구하기
%디지털 전달함수로부터 주파수 응답을 구함
Hs_w = freqs(Hs_n,Hs_d,w); %아날로그 butterworth 필터의 주파수 응답
Hz_W_f1 = freqz(Hz_n_f1,Hz_d_f1,W/fs_1); %5hz 이산화 된 디지털 필터의 주파수 응답
Hz_W_f2 = freqz(Hz_n_f2,Hz_d_f2,W/fs_2); %10hz 이산화 된 디지털 필터의 주파수 응답

figure(1)
subplot(2,2,1)
plot(x,y,'b--')
hold on;
grid on;
plot(z_s,'ko','MarkerSize',10,'LineWidth',1.3)
plot(p_s,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1,1])
xlabel("Real(s)")
ylabel("Imag(s)")
axis equal

subplot(2,2,3)
plot(x,y,'b--')
hold on;
grid on;
plot(z_f1,'ko','MarkerSize',10,'LineWidth',1.3)
plot(p_f1,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1,1])
xlabel("Real(z)")
ylabel("Imag(z)")
axis equal

subplot(2,2,4)
plot(x,y,'b--')
hold on;
grid on;
plot(z_f2,'ko','MarkerSize',10,'LineWidth',1.3)
plot(p_f2,'kx','MarkerSize',10,'LineWidth',1.3)
ylim([-1,1])
xlabel("Real(z)")
ylabel("Imag(z)")
axis equal

figure(2)
subplot(2,1,1)
plot(w,abs(Hs_w),'b','LineWidth',4)
hold on
grid on
plot(W,abs(Hz_W_f1),'g','LineWidth',3)
plot(W,abs(Hz_W_f2),'r','LineWidth',2)
xlim([0,2])
ylim([0,1.4])
xlabel("Frequency \omega [rad/sec]")
ylabel("|H({\omega})|")
legend("Analog Butterworth Filter","Digital Butterworth Filter, f_s=5Hz","Digital Butterworth Filter, f_s=10Hz")

subplot(2,1,2)
plot(w,abs(Hs_w),'b','LineWidth',4)
hold on
grid on
plot(W,abs(Hz_W_f1),'g','LineWidth',3)
plot(W,abs(Hz_W_f2),'r','LineWidth',2)
xlim([0.9,1.1])
ylim([0.6,0.8])
xlabel("Frequency \omega [rad/sec]")
ylabel("|H({\omega})|")
legend("Analog Butterworth Filter","Digital Butterworth Filter, f_s=5Hz","Digital Butterworth Filter, f_s=10Hz")

figure(3)
subplot(3,1,1)
L = 50;
n = linspace(0,L-1,L);
x_f2 = dirac(n);
x_f2_infindex = (x_f2 == Inf);
x_f2(x_f2_infindex) = 1;
hn_f = filter(Hz_n_f2,Hz_d_f2,x_f2);
stem(n,hn_f,'k','LineWidth',1,'MarkerFace','k')
ylim([0,0.05])
xlabel("n")
ylabel("h[n], L=50")
grid on;

subplot(3,1,2)
L = 100;
n = linspace(0,L-1,L);
x_f2 = dirac(n);
x_f2_infindex = (x_f2 == Inf);
x_f2(x_f2_infindex) = 1;
hn_f = filter(Hz_n_f2,Hz_d_f2,x_f2);
stem(n,hn_f,'k','LineWidth',1,'MarkerFace','k')
ylim([-0.02,0.06])
xlabel("n")
ylabel("h[n], L=100")
grid on

subplot(3,1,3)
L = 150;
n = linspace(0,L-1,L);
x_f2 = dirac(n);
x_f2_infindex = (x_f2 == Inf);
x_f2(x_f2_infindex) = 1;
hn_f = filter(Hz_n_f2,Hz_d_f2,x_f2);
stem(n,hn_f,'k','LineWidth',1,'MarkerFace','k')
ylim([-0.02,0.06])
xlabel("n")
ylabel("h[n], L=150")
grid on


%figure 1 결과
% 아날로그 필터 및, 이산화된 디지털 필터의 pole, zero
% 아날로그 필터의 안정성은 제한적으로 디지털 필터의 안정성과 일치한다.
% 세 필터 모두 안정됨.(단위원 내 극점 존재)

%figure 2 결과
% 아날로그 필터 및 디지털 필터(5, 10hz sampling)의 주파수 응답 비교
% bilinear trasformation는 s와 z도메인의 관계에서 나오는 초월함수(log)를 유리식으로 
% 근사화를 한 것이기 때문에 주파수 응답에 약간의 오차가 발생.

%figure3 결과
%Hz_f1 = tf(Hz_n_f1,Hz_d_f1)
%Hz_f2 = tf(Hz_n_f2,Hz_d_f2)
%위 두 전달함수의 분모를 보면, 과거 출력에 대한 term이 있기 때문에
% IIR 필터




