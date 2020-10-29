clf;
s = tf('s');

G1 = (s+8) / ((s+3) *(s+6)*(s+10));
G2 = ((s+51) * (s+8)) / ((s+3) *(s+6)*(s+10));
G3 =  (((s+51) * (s+8) * (s+0.6))/s) /  ((s+3) *(s+6)*(s+10));

figure(1)
hold on;
sys1 = feedback(G1,1)
rlocus(sys1)
sys2 = feedback(G2,1)
rlocus(sys2)
sys3 = feedback(G3,1)
rlocus(sys3)

%근궤적 파악
