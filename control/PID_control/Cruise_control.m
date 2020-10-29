%정속주행

%요구사항
% 자동차 질량 m = 1000kg
% damping coefficient = 50 Ns/m
% reference speed = 10m/s

% Rise time <5s
% Overshoot < 10%
% steady-state error < 2%

m = 1000;
b = 50; 
r = 10;

t = 0:0.1:20;

s = tf('s');

P_cruise = 1/(m*s + b);
%P 제어
kp = 5000;
C = pid(kp);
Tp = feedback(C*P_cruise, 1);


%Pi 제어
Kp = 600;
Ki = 1;
Cpi = pid(Kp, Ki);
Tpi = feedback(Cpi*P_cruise, 1);

%PID 제어
Kpid = 800;
Kii = 40;
Cpid = pid(Kpid, Kii);

Tpid = feedback(Cpid*P_cruise, 1);

figure(1)
hold on;
axis([0 20 0 10])
step(r*Tp, t)
step(r*Tpi, t)
step(r*Tpid, t)