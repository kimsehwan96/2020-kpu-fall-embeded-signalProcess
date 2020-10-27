%N point DFT
% 결과값 이산 주파수는 -0.5 ~ 0.5 범위에서 출력.

function [f_hat,Xk,N_mult] = nDFT(x_n,N)

N_mult = N*N; % N point DFT의 곱하기 연산은 N*N번 수행된다.
% 50개의 linspace 생성
f_hat = linspace(-0.5,0.5-(1/N),N);
Xk = zeros(1,N);
n = linspace(0,N-1,N);%0부터 N-1까지의 Linspace 생성.
k = n;

sum_space = zeros(1,N); %시그마 연산을 모든 원소에 대해서 하기 위해서 이중 for문 및 k와 n은 동일하게 설정
for k_domain = k
    for n_domain = n
        sum_space(1,n_domain + 1) = x_n(1,n_domain + 1) .* exp(-1i*(2*pi/N))^(k_domain*n_domain); %DFT 실제 로직
        Xk(1,k_domain + 1) = sum(sum_space); %시그마연산이 끝난 값을 Xk 에 대입
    end
end

end





