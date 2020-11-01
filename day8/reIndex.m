function x_reIndex = reIndex(x_n,N)   
    n = linspace(0,N-1,N);
    N_div = log2(N);
    n_bit = fliplr(dec2bin(n,N_div));
    n_reIndex = bin2dec(n_bit);
    x_reIndex= x_n(n_reIndex + 1);
end