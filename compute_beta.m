function [ Beta] = compute_beta( Y, sig_est_Y2, sig_est )

n = size(Y,1);

%calcul de kappa
kappa_est_Y = 0;
for i = 1:n
    for j = 1:n
        kappa_est_Y = kappa_est_Y + Y(i,j)^4;
    end
end
kappa_est_Y = kappa_est_Y / (sig_est_Y2^2 * n^2);

%Estimation de beta
syms cbeta
%d'après l'equation 28 du papier
% j'avoue que je ne saurais pas le redémontrer
eqn = kappa_est_Y ==  (1/(sig_est_Y2^2)) * ( 6 * sig_est^2 * sig_est_Y2 - 3 * sig_est^4 + (sig_est_Y2 - sig_est^2)^2 * (gamma(1/cbeta) * gamma(5/cbeta) / ((gamma(3/cbeta))^2)) );
solx = solve(eqn, cbeta);

Beta = solx;

end

