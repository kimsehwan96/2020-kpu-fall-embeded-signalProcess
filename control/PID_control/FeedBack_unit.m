K_p = 122;
K_pd = 10.7;
K_pid = 6.2;
s=tf('s');

sys1 = K_p*(s+8)/((s+3)*(s+6)*(s+10));
sys2 = 1;
sys3 = K_pd*(s+8)*(s+51)/((s+3)*(s+6)*(s+10));
sys4 = K_pid * (((s+51) * (s+8) * (s+0.6))/s) /  ((s+3) *(s+6)*(s+10));
sys = feedback(sys1, sys2);
sys_pd = feedback(sys3, sys2);
sys_pid = feedback(sys4, sys2);
t = 0:0.01:1.2;

figure(1)
hold on;
step(sys,t);
step(sys_pd,t);
step(sys_pid, t);
