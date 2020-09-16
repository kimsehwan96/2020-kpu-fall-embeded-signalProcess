clear;
clc;

t = linspace(0, 6, 600);

y1 = exp(-t);
y2 = cos( pi*t )
y3 = y1 .* y2 ; % <- 원소 끼리의 곱하기이기 때문에 .* 을 해줘야 한다.
figure(1);

subplot(311);
plot(t, y1, '-b');
subplot(312);
plot(t, y2, '-b');
subplot(313);
plot(t, y3, '-b');



