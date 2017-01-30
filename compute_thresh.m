function [ T ] = compute_thresh( S, sigma_est )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

sig_est_S2 = compute_sig_est_Y2(S);
%calcul de sig_est_X et du seuil T
if (sig_est_S2 > sigma_est * sigma_est)
    sigma_est_X = sqrt(sig_est_S2 - sigma_est * sigma_est);
    T = sigma_est * sigma_est / sigma_est_X;
else
    S = abs(S);
    T = max(max(S));
end
end

