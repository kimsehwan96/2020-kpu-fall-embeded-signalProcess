clear
clc

%그림에서의 영점은 모두 -5
%극점은 각각 p1, p2, p3에 나타낸것과 같다.

z = -5;
p1 = [-1 + 2j,-1 - 2j];
p2 = [2j, -2j];
p3 = [1 + 2j,1 - 2j];

%영점과 극점을 이용해 전달함수 생성
%zp2tf는 영점과 극점을 입력하면 출력으로
%전달함수의 분모 계수 벡터 및 분자 계수 벡터가 나옴.
[z_s,p1_s] = zp2tf(z,p1,1);
[z_s,p2_s] = zp2tf(z,p2,1);
[z_s,p3_s] = zp2tf(z,p3,1);

%tf라는 전달함수 생성 함수
%분모 계수 및 분자 계수를 입력하면 전달 함수를 생성해줌
%tf([-5], [1, 2, 3]) 일경우 s + 5 / s^2 + 2s + 3 과 같은 전달함수 생성
H_w1 = tf(z_s,p1_s)
H_w2 = tf(z_s,p2_s)
H_w3 = tf(z_s,p3_s)

t = linspace(0,10,1024);
%전달함수로부터 충격응답을 계산하기 위한(라플라스 역변환을 위한) 부분 분수 계산
[s_z1,s_p1,k] = residue(z_s,p1_s);
[s_z2,s_p2,k] = residue(z_s,p2_s);
[s_z3,s_p3,k] = residue(z_s,p3_s);

%부분분수를 이용한 충격응답 계산
h_t1 = s_z1(1) * exp(s_p1(1) .* t);
h_t2 = s_z1(2) * exp(s_p1(2) .* t);
h_ta = h_t1 + h_t2;

%부분분수를 이용한 충격응답 계산
h_t3 = s_z2(1) * exp(s_p2(1) .* t);
h_t4 = s_z2(2) * exp(s_p2(2) .* t);
h_tb = h_t3 + h_t4;

%부분분수를 이용한 충격응답 계산
h_t5 = s_z3(1,1) * exp(s_p3(1,1) .* t);
h_t6 = s_z3(2,1) * exp(s_p3(2,1) .* t);
h_tc = h_t5 + h_t6;


figure(1)
subplot(3,1,1)
plot(t,h_ta,'k','LineWidth',2);
ylabel('h(t), system #1');
ylim([-0.5 1.5]);
set(gca,'Xtick',[0:1:10])
set(gca,'Ytick',[-0.5:0.5:1.5])
grid on

subplot(3,1,2)
plot(t,h_tb,'k','LineWidth',2);
ylabel('h(t), system #2');
ylim([-4 4]);
set(gca,'Xtick',[0:1:10])
set(gca,'Ytick',[-4:2:4])
grid on

subplot(3,1,3)
plot(t,h_tc,'k','LineWidth',2);
ylabel('h(t), system #3');
ylim([-5*(10^4) 10*(10^4)]);
set(gca,'Xtick',[0:1:10])
set(gca,'Ytick',[-5*10^4:5*10^4:10*10^4])
grid on



