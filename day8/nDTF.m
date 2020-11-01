function [f_hat,Xk,N_mult] = nDFT(x_n,N)

N_mult = N*N;
f_hat = linspace(-0.5,0.5-(1/N),N);
Xk = zeros(1,N);
n = linspace(0,N-1,N);
k = n;

sum_space = zeros(1,N);
for k_domain = k
    for n_domain = n
        sum_space(1,n_domain + 1) = x_n(1,n_domain + 1) .* exp(-1i*(2*pi/N))^(k_domain*n_domain);
        Xk(1,k_domain + 1) = sum(sum_space);
    end
end

end





