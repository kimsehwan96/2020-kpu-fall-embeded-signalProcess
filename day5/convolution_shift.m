function [y, n] = convolution(x1, n1, x2, n2, n0)

    n = min(n1) + min(n2) : max(n1) + max(n2);

    if (n0 == 0)
        for i = 1:length(n1)+length(n2)-1
            % y(i) = 0;
            X1 = [zeros(1,length(x2)), x1, zeros(1, length(x2)-1)];
            X2 = [zeros(1, i), fliplr(x2), zeros(1, length(x1)-1+length(x2)-i)];
            y(i) = sum(prod([X1;X2]));
        end
    end
    
    if (n0 < 0)
        for i = 1:length(n1)+length(n2)-1
            X1 = [zeros(1,length(x2)), x1, zeros(1, length(x2)-1), zeros(1, -n0)];
            X2 = [zeros(1, -n0), zeros(1, i), fliplr(x2), zeros(1, length(x1)-1+length(x2)-i)];
            y(i) = sum(prod([X1;X2]));
        end
    end
    
    if (n0 > 0)
        for i = 1:length(n1)+length(n2)-1
            X1 = [zeros(1, n0), zeros(1,length(x2)), x1, zeros(1, length(x2)-1)];
            X2 = [zeros(1, i), fliplr(x2), zeros(1, length(x1)-1+length(x2)-i), zeros(1,n0)];
            y(i) = sum(prod([X1;X2]));
        end   
    end
    