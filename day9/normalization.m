function [normal] = normalization(array)
    array_abs = abs(array);
    max_arr = max(max(array_abs));
    normal = (array_abs ./ max_arr) * 128;
end

    
    
   