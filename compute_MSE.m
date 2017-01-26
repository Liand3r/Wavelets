function [ MSE] = compute_MSE( X1, X2)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
N = size(X1, 2);
MSE = 0;
for i = 1:N
    for j = 1:N
        MSE = MSE + (X1(i,j) - X2(i,j))^2;
    end
end
MSE = MSE/(N*N);


end

