
t=0:0.1:20*pi;
duty_cycle=60; % Percentage 
x = square(t,duty_cycle);
plot(t/(2*pi),0.5*x+0.5)
grid on
axis([0 5 0 1]);

