x = 0:pi/100:2*pi;
y = sin(x);
xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')
plot(x,y)

hold on % ??? ??? ?? ???

y2 = cos(x);
plot(x, y2, ':')
legend('sin', 'cos')

hold off

% 0 - 100?? (??)


