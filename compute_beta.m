function [ Beta] = compute_beta( Y, sig_est_Y2, sig_est )

n = size(Y,1);

%calcul de kappa
Y_pow = Y.^4;
kappa_est_Y = sum(Y_pow(:));
kappa_est_Y = kappa_est_Y / (sig_est_Y2^2 * n^2);
%Estimation de beta
syms cbeta
%d'après l'equation 28 du papier
% j'avoue que je ne saurais pas le redémontrer
eqn = kappa_est_Y * (sig_est_Y2^2) == ( 6 * sig_est^2 * sig_est_Y2 - 3 * sig_est^4 + (sig_est_Y2 - sig_est^2)^2 * (gamma(1/cbeta) * gamma(5/cbeta) / ((gamma(3/cbeta))^2)) );
solx = solve(eqn, cbeta);

Beta = solx;

end

