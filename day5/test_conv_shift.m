clc;
clear;

A = 1;
f = 0.1;
theta = 0;

n1 = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
x1 = A*cos(2*pi*f*n1 + theta);

n2 = [0 1 2 3 4 5];
x2 = (0.5).^n2;

n0 = -2;

[y, n] = convolution_shift(x1, n1, x2, n2, n0);

figure(1)
subplot(311)
stem(n1, x1, 'filled');
xlabel('n');
ylabel('x1[n]');

subplot(312)
stem(n2, x2, 'filled');
xlabel('n');
ylabel('x2[n]');

subplot(313)
stem(n, y, 'filled');
xlabel('n');
ylabel('y[n]');
% ylim([1 -1]);