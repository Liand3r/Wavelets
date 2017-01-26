function [ sig_est ] = compute_sig_est( Y)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

N= size(Y,1);
HH1 = Y((N/2)+1:N,(N/2)+1:N) ;
l = zeros(N*N/4, 1);
for i = 1:N/2
    for j = 1:N/2
        l(j + (i-1)*N/2) = abs(HH1(i,j));     
    end
end
l = sort(l);
sig_est = median(l)/0.6745;




end

