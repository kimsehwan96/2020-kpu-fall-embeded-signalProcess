function[y] = amp_k_alpha(alpha, K, Amp_in)

    y = [];
    for idx = 1:length(Amp_in)
        if (Amp_in(idx) * alpha) < K
            if (Amp_in(idx) * alpha) > -K
                y(idx) = alpha * Amp_in(idx);
            elseif (Amp_in(idx) * alpha) < - K
                y(idx) = - K;
            end
        else
            y(idx) = K;
        end
    end
    