clc ;
clear ;

center_x = 5
center_y = 10
radius = 10;
thetha = 0:0.1:2*pi;

x_func = radius .* sin(thetha) + center_x ;
y_func = radius .* cos(thetha) + center_y ;

figure(1)
plot(x_func, y_func);
grid on;
xlabel('X');
ylabel('Y');
title('Circle');

% 연습1번 클리어