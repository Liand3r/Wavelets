function [ T ] = compute_thresh( S, sigma_est )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = size(S, 1);
%Calcul de sig_est_Y2
sig_est_S2 = 0;
for i = 1:N
    for j = 1:N
        sig_est_S2 = sig_est_S2 + S(i,j) * S(i,j);
        
    end
end
sig_est_S2 = sig_est_S2 * 4 / (N * N)

%calcul de sig_est_X et du seuil T
if (sig_est_S2 > sigma_est * sigma_est)
    sigma_est_X = sqrt(sig_est_S2 - sigma_est * sigma_est);
    T = sigma_est * sigma_est / sigma_est_X;
else
    S = abs(S);
    T = max(max(S));
end
end

