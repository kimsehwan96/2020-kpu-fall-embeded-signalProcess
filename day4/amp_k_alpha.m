function y = amp_k_alpha(alpha, K, Amp_in)

y = alpha*x;

idx = find(abs(y) > K);
% 절대값으로 바꾼 뒤 K보다 큰 벡터 index를 찾는다 (y벡터)
y(idx)=sign(y(id)) * K;
% sign는 부호함수, 양수일 때 + , 음수 일 때 - 이기 때문에

% professor code