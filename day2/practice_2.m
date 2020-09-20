clear ;
clc;

tau = 1;
%width = 0.5;
%0.5 - 0.15 = 0 ~ 0.35 ~ 0.65 <- 0
%0 0.35 ~ 0.75 1
%1 1.35 ~ 1.75 2?

y = []
x = 0:0.01:5;
length(x)
for idx = 1: length(x)

    if mod(x(idx), tau) > (tau/2) %- (width/2)
        y(idx) = 0;
    else
        y(idx) = 1;
    end
end

figure(1)
plot(x,y)
grid on;
xlabel('X');
ylabel('Y');
