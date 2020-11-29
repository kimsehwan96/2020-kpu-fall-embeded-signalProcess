clc
clear
N = 7; %7차 butterworth 필터
fc = 300; %컷오프 주파수 300hz
fs = 3000; %샘플링 주파수 3000hz
fd = linspace(0,600,1024); %freqeuncy domain
f1 = 100; % 각 신호의 발생주기 100hz
f2 = 500; %각 신호의 500hz
%n = 0,1,2,...500
n = linspace(0,499,500);
W = linspace(0,499,500);

xn = cos(2*pi*f1*(n/fs)) + cos(2*pi*f2*(n/fs));
% 입력 신호 생성 

[LF_z,LF_p,LF_k] = buttap(N); %7차 butterworth 필터 생성
[LF_n,LF_d] = zp2tf(LF_z,LF_p,LF_k); %buttap으로 생성된 pole, zero를 이용해 전달함수 생성
[LF_c_n,LF_c_d] = lp2lp(LF_n,LF_d,fc*2*pi);%lowpass filter의
%cut off 주파수를 변경 (300hz)

[LF_c_D_n,LF_c_D_d] = bilinear(LF_c_n,LF_c_d,fs);
% 3000hz 주기로 이산화 된 디지털 전달함수 생성

LF_c_D = freqz(LF_c_D_n,LF_c_D_d,fd*2*pi/fs);
%이산화된 필터의 주파수 응답

t = 0:1/fs:0.1;
xt = cos(2*pi*f1*t) + cos(2*pi*f2*t);
yt = filter(LF_c_D_n,LF_c_D_d,xt);
yn = filter(LF_c_D_n,LF_c_D_d,xn);

%크기 스펙트럼 계산
[f0,X] = myfun_SA(n/fs,xn);
[f0_1,Y] = myfun_SA(n/fs,yn);

figure(5)
subplot(3,2,1)
t = 0:1/fs:0.1;
xt = cos(2*pi*f1*t) + cos(2*pi*f2*t);
plot(t,xt,'k','LineWidth',1.8)
xlabel("t[sec]");
ylabel("x(t)");
grid on

subplot(3,2,2)
plot(f0,abs(X),'ok-','LineWidth',1.8,'MarkerFace','k')
xlim([0,600])
ylim([0,0.08])
grid on
xlabel("Frequency, f[Hz]");
ylabel("|X(f)|");

subplot(3,2,4)
plot(fd,abs(LF_c_D),'k','Linewidth',1.8)
xlabel("Frequency, f[Hz]");
ylabel("Frequency response,|X(f)|");
grid on

subplot(3,2,5)
plot(t,yt,'k','Linewidth',1.8)
xlabel("t[sec]");
ylabel("y(t)");
ylim([-1.5,1.5])
grid on

subplot(3,2,6)
plot(f0_1,abs(Y),'ok-','LineWidth',1.8,'MarkerFace','k')
xlim([0,600])
xlabel("Frequency, f[Hz]");
ylabel("|Y(f)|");
grid on

% figure 5
% 생성한 입력신호를 필터를 통과시킨다
% 300hz 컷오프 주파수가 정상적으로 동작하는지 확인해본다.
% 입력의 크기스펙트럼의 경우 100과 500hz 범위에서 튀는것을 확인
% 출력의 크기스펙트럼의 경우 cutoff 주파수인 500hz가 넘는 요소는 제거
% 따라서 출력의 크기스펙트럼에는 100hz의 요소가 보인다.
% 따라서 y(t) (time domain)에서 보더라도, 100hz의 요소만 남은것이 확인 된다.
