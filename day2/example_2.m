clear ;
clc ;

t = 0:0.1:4;

f = 0.5;

y = cos( 2*pi*f*t );

figure(1)
stem(t,y) % 이산 그래프를 그릴때 적합
xlabel('Time , t [sec]');
ylabel('Singal y(t)');
title('Sinusoid');

figure(2)
stem(t, y, 'filled');
xlabel('Time , t [sec]');
ylabel('Singal y(t)');
title('Sinusoid');

 % stem -> 이산 그래프 그릴 때 사용.