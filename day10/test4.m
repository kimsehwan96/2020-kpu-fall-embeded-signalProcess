clear
clc

z = -5; %그림에서의 영점 -5

p1 = [0.35355+0.35355j,0.35355-0.35355j]; %그림에서의 극점 계산
% x(real)는 0.5 * cos(pi/4), y(img)는 0.5 * sin(pi/4)

p2 = [0.707107+0.707107j,0.707107-0.707107j];
% x(real)는 cos(pi/4), y(img)는  sin(pi/4)

p3 = [1.06066+1.06066j,1.06066-1.06066j];
% x(real)는 1.5 * cos(pi/4) y(img)는 1.5 * sin(pi/4)

%영점과 극점을 이용한 전달함수 계수 벡터 구하기
[z_z,p1_z] = zp2tf(z,p1,1);
[z_z,p2_z] = zp2tf(z,p2,1);
[z_z,p3_z] = zp2tf(z,p3,1);

%계수 벡터를 이용한 전달함수 생성
H_W1 = tf(z_z,p1_z)
H_W2 = tf(z_z,p2_z)
H_W3 = tf(z_z,p3_z)

n = linspace(0,20,21);
%inverse z transform을 위한 부분분수 계산
[z_z1,z_p1,k] = residue(z_z,p1_z);
[z_z2,z_p2,k] = residue(z_z,p2_z);
[z_z3,z_p3,k] = residue(z_z,p3_z);

%z transfomr 계산
h_n1 = z_z1(1,1) * (z_p1(1,1) .^ n);
h_n2 = z_z1(2,1) * (z_p1(2,1) .^ n);
h_na = h_n1 + h_n2;

h_n3 = z_z2(1,1) * (z_p2(1,1) .^ n);
h_n4 = z_z2(2,1) * (z_p2(2,1) .^ n);
h_nb = h_n3 + h_n4;

h_n5 = z_z3(1,1) * (z_p3(1,1) .^ n);
h_n6 = z_z3(2,1) * (z_p3(2,1) .^ n);
h_nc = h_n5 + h_n6;

figure(1)
subplot(3,1,1)
h_na_disp = circshift(h_na,1);
h_na_disp(1,1) = 0;
stem(n,h_na_disp,'k','LineWidth',2,'MarkerFace','k');
ylabel("h(n), system #1");
ylim([-2 6]);
set(gca,'Xtick',[0:2:20])
set(gca,'Ytick',[-2:2:6])
grid on

subplot(3,1,2)
h_nb_disp = circshift(h_nb,1);
h_nb_disp(1,1) = 0;
stem(n,h_nb_disp,'k','LineWidth',2,'MarkerFace','k');
ylabel("h(n), system #2");
ylim([-10 10]);
set(gca,'Xtick',[0:2:20])
set(gca,'Ytick',[-10:5:10])
grid on

subplot(3,1,3)
h_nc_disp = circshift(h_nc,1);
h_nc_disp(1,1) = 0;
stem(n,h_nc_disp,'k','LineWidth',2,'MarkerFace','k');
ylabel("h(n), system #3");
ylim([-5*(10^3) 10^4]);
set(gca,'Xtick',[0:2:20])
set(gca,'Ytick',[-5000:5000:10000])
grid on