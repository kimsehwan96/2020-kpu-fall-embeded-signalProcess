clear;
clc;

t1 = -5
t2 = 5
N = 4096
f_s = 20

tau = 20 * pi
[impulse_t, impulse_p] = GenImpulse(t1, t2, f_s, N);
t = impulse_t;
x_t = tau * sinc((tau * t)/(2 * pi));
Samplified_y = prod([x_t; impulse_p]);

%for picuture 7
figure(1)
%plot(t, impulse_p);
% subplot(3,2,1)
% plot(t, impulse_p);
% xlim([-1,1]);
% subplot(3,2,3)
% plot(t, x_t);
% xlim([-1,1]);
% subplot(3,2,5)
% plot(t, Samplified_y);
% xlim([-1,1]);
% [t_f0 , X] = myfun_SA(t, impulse_p);
 [t_f0, X_sinc] = myfun_SA(t, x_t);
% [t_f0, X_samp] = myfun_SA(t,Samplified_y);
% subplot(3,2,2)
% plot(t_f0, abs(X));
% xlim([-30,30]);
% subplot(3,2,4)
 plot(t_f0, abs(X_sinc));
 xlim([-30,30]);
% subplot(3,2,6)
% plot(t_f0, abs(X_samp));
% xlim([-30,30]);