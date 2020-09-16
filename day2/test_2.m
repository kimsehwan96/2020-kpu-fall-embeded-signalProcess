clear ;
clc ;

t = linspace(0, 5, 100);
f = 1;
y = sin( 2*pi*f*t );

figure(1);
plot(t, y, '-or') ;
title('Sinusoid example. f=1Hz');
xlabel('Time, t [sec]');
ylabel('Signal, y');

axis([0 5 -1.5 1.5]);


t = linspace(0, 5, 100);
f = 0.5;
y = sin( 2*pi*f*t );

figure(2);
plot(t, y, '-or') ;
title('Sinusoid example. f=0.5Hz');
xlabel('Time, t [sec]');
ylabel('Signal, y');

axis([0 5 -1.5 1.5]);