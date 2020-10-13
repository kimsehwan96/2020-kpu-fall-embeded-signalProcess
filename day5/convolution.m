function [y, n] = convolution(x1, n1, x2, n2)

    n = min(n1) + min(n2) : max(n1) + max(n2);

    for i = 1:length(n1)+length(n2)-1
        % y(i) = 0;
        X1 = [zeros(1,length(x2)), x1, zeros(1, length(x2)-1)];
        X2 = [zeros(1, i), fliplr(x2), zeros(1, length(x1)-1+length(x2)-i)];
        y(i) = sum(prod([X1;X2]));
    end