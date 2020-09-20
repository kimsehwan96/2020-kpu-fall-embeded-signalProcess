clear ;
clc;

tau = 1;
width = 0.3;
% 0~0.3 1 
% 0.7 ~1 1
%0.3 ~ 0.7 tau - width 가 기준이네
% 시작부터 0.3 ~ 
y = []
x = 0:0.01:5;
length(x)
for idx = 1: length(x)
    if mod(x(idx), tau) > width % over 0.3
        if mod(x(idx), tau) < tau - width
            y(idx) = 0;
        else
            y(idx) = 1;
        end
    else
        y(idx) = 1;
    end
end

y_2 = []

for idx = 1: length(x)
    if y(idx) == 0
        y_2(idx) = cos(2*pi*5*x(idx));
    else
        y_2(idx) = cos(2*pi*5*x(idx) + pi);
    end
end

figure(1)
plot(x,y_2)
grid on;
xlabel('X');
ylabel('Y');
axis([0 2 0 1]);

