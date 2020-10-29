function [impulse_t, impulse_p] = GenImpulse(t1, t2, f_s, N)
  T_s = 1/f_s

  left_max_pulse = abs(fix(t1/T_s));
  right_max_pulse = (fix(t2/T_s));
  each_zero = 0;
  last_zero = 0;
  result_pulse = [];
  posible_pulse_num = left_max_pulse + right_max_pulse;

  if posible_pulse_num < N
    zero_pulse_num = N - posible_pulse_num;
    each_zero = fix(zero_pulse_num/ (posible_pulse_num - 1));
    last_zero = rem(zero_pulse_num, (posible_pulse_num - 1));
    if last_zero > each_zero
      N = N - last_zero;
      last_zero = 0; 
    end
    n_range = T_s/(each_zero + 1);
  else
    posible_pulse_num = N;
    zero_pulse_num = 0;
    each_zero = 0;
    last_zero = 0;
    n_range = T_s;
  end
  
  for i = 1 : posible_pulse_num - 1
    result_pulse = [result_pulse 1];
    for j = 1 : each_zero
      result_pulse = [result_pulse 0];
   
    end
  end
  result_pulse = [result_pulse 1];
  for i = 1 : last_zero
      result_pulse = [result_pulse 0];
    
  end
  
  pulse_n = t1:n_range:t1 + n_range * (N - 1);
  impulse_t  = pulse_n;
  impulse_p = result_pulse;
  end
