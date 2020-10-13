clc;
clear;

A = 1;
f = 0.1;
theta = 0;

n1 = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15];
x1 = A*cos(2*pi*f*n1 + theta)

shift = -5;

tmp = [];
% for signal shifiting
%n1_shifted와 매칭 & x1에 제로패딩 추가
%x1_shifted
if (shift > 0)
    tmp = max(n1) + 1:max(n1) + shift;
    n1_shifted = [n1, tmp]
    x1_shifted = [zeros(1,shift), x1]
end

if (shift < 0)
    tmp = min(n1) + shift :min(n1) - 1;
    n1_shifted = [tmp, n1]
    x1_shifted = [x1, zeros(1,abs(shift))]
end


n2 = [0 1 2 3 4 5];
x2 = (0.5).^n2;


[y, n] = convolution(x1_shifted, n1_shifted, x2, n2);

figure(1)
subplot(311)
stem(n1_shifted, x1_shifted, 'filled');
%stem(n1, x1, 'filled');
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