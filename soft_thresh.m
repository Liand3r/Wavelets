
function [ Y ] = soft_thresh( X,T )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N = size(X, 1)
Y = zeros(N,N)
for i =1:N
    for j = 1:N
        Y(i,j) = sign(X(i,j)) * max(abs(X(i,j))-T, 0);
    end
end

end

