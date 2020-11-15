clear
clc

%H(s)
z = roots([1 5]); %H(s) 의 분자부분의 해를 구한다 
p = roots([1 2 5]); % H(s)의 분모부분 해를 구한다 
%분자의 해 (영점)과 분모의 해(극점)을 복소평면상에 그리기 위해 z, p를 구함

real_z = real(z); %입력신호의 실수부
imag_z = imag(z); %입력신호의 허수부

real_p = real(p);
imag_p = imag(p);


t = linspace(0,10,1024); %delta
[s_z,s_p,k] = residue([1 5],[1 2 5]); %H(s)의 부분분수를 구한다.(인수분해)
% s_z는 분자 벡터, s_p는 분모 벡터들 (각 순서는 동일)
%H(S)로부터 h(t)를 구하기 위해서는 라플라스 역변환을 해야 한다.

%임펄스응답(충격응답), h(t)를 구하기 위한 과정.
%제시된 전달함수는 부분함수로 전개시에 분모는 1차, 분자는 0차의 형태인
% b / s + a 형태이므로 라플라스 역변환시 b * exp(-at)의 형태로 표현 됨.
h_t1 = s_z(1) * exp(s_p(1) .* t);  %위 결과에 따라서 각 부분분수를 라플라스 역변환 한
h_t2 = s_z(2) * exp(s_p(2) .* t); %h(t) 요소가 두개 나오며, 각각을 구해서 더한다.

h_t = h_t1 + h_t2;
%최종적인 임펄스 응답.

%주파수 응답은 전달함수의 s도메인을 jw로 치환 한 것임
w = linspace(-4,4,1024);
w_z = j.*w - z; %s - z 대신 jw - z 의 형태로 보이는 것.
w_p1 = j.*w - s_p(1); % 위와 동일
w_p2 = j.*w - s_p(2);

H_w = abs(w_z ./ (w_p1 .* w_p2)); %주파수 스펙트럼(응답)을 구한다.

%영점과 극점을 그림.
figure(1)
plot(real_p,imag_p,'xk','MarkerSize',15) %극점의 실수부와 허수부(x,y축)
xlim([-6 0]);
ylim([-2.5 2.5]);
hold on;
plot(real_z,imag_z,'ok','MarkerSize',15) %영점의 실수부와 허수부
xlabel('Real(s)');
ylabel('Imag(s)');
set(gca,'Ytick',[-2.5:0.5:2.5])
grid on;

figure(2)
plot(t,h_t,'k','LineWidth',2); %위에서 구한 임펄스 응답을 그림
xlabel('t[sec]');
ylabel('h(t)');
ylim([-0.4,1.6]);
set(gca,'Xtick',[0:1:10])
set(gca,'Ytick',[-0.4:0.2:1.6])
grid on

figure(3)
plot(w,H_w,'k','LineWidth',2) %주파수 응답을 구한 것,
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|');
set(gca,'Xtick',[-4:1:4])
set(gca,'Ytick',[0.4:0.1:1.4])
grid on;

