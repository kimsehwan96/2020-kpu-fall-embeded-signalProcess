clear;
clc;

t1 = -5
t2 = 5
N = 4096
f_s = 15

tau = 20 * pi
[impulse_t, impulse_p] = GenImpulse(t1, t2, f_s, N);
t = impulse_t;
x_t = tau * sinc((tau * t)/(2 * pi));
Samplified_y = prod([x_t; impulse_p]);

fc=8;
[z, p, k] = buttap(5)
[num, den] = zp2tf(z,p,k);
[num, den] = lp2lp(num, den, 2*pi*fc);
[num_d, den_d] = bilinear(num, den, 1/abs(t(2)-t(1)));

y_out = filter(num_d, den_d, Samplified_y);



%Transforming!
[f0, X0] = myfun_SA(impulse_t, impulse_p);
X0 = abs(X0);
[f1, X1] = myfun_SA(t, Samplified_y);
X1 = abs(X1);
[f2, X2] = myfun_SA(t, y_out);
X2 = abs(X2);

figure (3)  
subplot(2,2,1)
  plot(t, Samplified_y);
  xlabel('1[sec]');
  ylabel('y(t)');
  xlim([-1,1]);
subplot(2,2,3)
  plot(f1, X1);
  xlabel('1[Hz]');
  ylabel('|Y(f)|');
  xlim([-30,30]);
subplot(2,2,2)
  plot(t, y_out);
  xlabel('1[sec]');
  ylabel('y(t)');
  xlim([-1,1]);
subplot(2,2,4)
  plot(f2, X2);
  xlabel('1[Hz]');
  ylabel('|Y_{cut}(f)|');
  xlim([-30,30]);
  