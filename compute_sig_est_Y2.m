function [sig_est_S2 ] = compute_sig_est_Y2(S)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = size(S, 1);
%Calcul de sig_est_Y2
sig_est_S2 = 0;
N = size(S, 1);
for i = 1:N
    for j = 1:N
        sig_est_S2 = sig_est_S2 + S(i,j) * S(i,j);
        
    end
end
sig_est_S2 = sig_est_S2 / (N * N);

end

