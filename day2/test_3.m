clear ;
clc ;

t = linspace(0, 2, 100);

f1 = 1;
f2 = 3;
f3 = 5;

y1 = cos( 2*pi*f1*t );
y2 = cos( 2*pi*f2*t );
y3 = cos( 2*pi*f3*t );
y4 = y1 + y2 + y3 ;

figure(1);

plot(t, y1, '-o', t, y2, '-x', t, y3, '-^', t, y4, '-d');

title('sinusoid');
xlabel('Time, t [sec]');
ylabel('Signal y(t)');
legend('1Hz', '3Hz', '5Hz', 'sum');