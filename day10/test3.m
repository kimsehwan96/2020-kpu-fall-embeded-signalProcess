clear
clc

%영점과 극점 계산
z = roots([1 -0.3]);
p = roots([1 0.3 0.36 0.108]);

real_z = real(z);
imag_z = imag(z);

real_p = real(p);
imag_p = imag(p);

%z transfrom 역변환을 찾기 위한 부분분수화
[z_z,z_p,k] = residue([1 -0.3],[1 0.3 0.36 0.108]);
n = linspace(0,20,21);

%z transform 계산
h_n1 = z_z(1) * (z_p(1) .^ n);
h_n2 = z_z(2) * (z_p(2) .^ n);
h_n3 = z_z(3) * (z_p(3) .^ n);
h_n = h_n1 + h_n2 + h_n3;

W = linspace(-pi,pi,1024); %-pi ~ pi 구간에서의 주파수 응답 확인
W_z = exp(j.*W) - z; % z domain -> exp(jW)로 변환
W_p1 = exp(j.*W) - z_p(1,1);
W_p2 = exp(j.*W) - z_p(2,1);
W_p3 = exp(j.*W) - z_p(3,1);

H_W = abs(W_z ./ (W_p1 .* W_p2 .* W_p3));

figure(5)
plot(real_p,imag_p,'xk','MarkerSize',15)
xlim([-1 1]);
ylim([-1 1]);
hold on;
plot(real_z,imag_z,'ok','MarkerSize',15)
theta = linspace(0,2*pi);
x = cos(theta);
y = sin(theta);
plot(x,y,'k--') %단위원을 그리기 위한 x,y계산 및 plot 
xlabel("Real(z)");
ylabel("Imag(z)");
axis equal
grid on;

figure(6)
h_n_disp = circshift(h_n,1);
h_n_disp(1,1) = 0;
stem(n,h_n_disp,'k','LineWidth',2,'MarkerFace','k');
xlabel("n");
ylabel("h(t)");
ylim([-0.6,1]);
%이산신호 그래프로 보이기 위해서 grid 설정 (x축 및 y축의 labeling)
set(gca,'Xtick',[0:2:20])
set(gca,'Ytick',[-0.6:0.2:1])    
grid on

figure(7)
plot(W,H_W,'k','LineWidth',2)
xlabel("Frequency W[rad]");
ylabel("|H(W)|");
ylim([0.2 1.8]);
xlim([-3 3]);
%이산신호 그래프로 보이기 위해서 grid 설정 (x축 및 y축의 labeling)
set(gca,'Xtick',[-3:1:3])
set(gca,'Ytick',[-0.2:0.2:1.8])
grid on;
