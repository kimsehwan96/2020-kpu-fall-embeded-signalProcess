clc ;
clear ;

% 원점이 0, 0 이고 반지름이 1인 원을 그려보자
center_x = 5
center_y = 10
x_ary = linspace(-1,1)
thetha = 0:0.1:2*pi
radius = 10
x_func = (radius - center_x) .* sin(thetha)
y_func = (radius - center_y) .* cos(thetha) 

figure(1)

plot(x_func, y_func);

