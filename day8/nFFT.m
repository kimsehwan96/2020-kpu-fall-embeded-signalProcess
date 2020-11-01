function [f_hat,Xk,N_mult] = nFFT(x_n,N)
n = linspace(0,N-1,N);
N_mult = (N/2)*(log2(N));
f_hat = linspace(-0.5,0.5-(1/N),N);
N_div = log2(N);
calc_space = zeros(1,N);
cnt = 0;

x_reIndex = reIndex(x_n,N);

    for calc_flag = 1:1:N_div
    
        cnt = cnt + 1;
        cnt_W = 0;
        cnt_index = 1;
        calc_state = N/(2^cnt);
        W = exp(-1i*(2*pi/(2^cnt)));

        st = 1; 
        ed = (2^cnt)/2;

        for calc_a = 1:1:calc_state
            for calc_b = st:1:ed
                calc_space(1,cnt_index) = x_reIndex(1,calc_b) + x_reIndex(1,calc_b+((2^cnt)/2))*(W^cnt_W);
                cnt_W = cnt_W + 1;
                cnt_index = cnt_index + 1;
            end
                cnt_W = 0;
             for calc_b = st:1:ed
                 calc_space(1,cnt_index) = x_reIndex(1,calc_b) - x_reIndex(1,calc_b+((2^cnt)/2))*(W^cnt_W);
                 cnt_W = cnt_W + 1;
                 cnt_index = cnt_index + 1;
             end
            cnt_W = 0;
            st = st + 2^cnt;
            ed = ed + 2^cnt;
        end
       st = 0;
       ed = 0;
       x_reIndex = calc_space; 
    end
    Xk = x_reIndex;
end