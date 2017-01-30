function [ Beta] = compute_beta( X )

n = size(X,1);

%Calul de sig_est_X2
sig_est_X2 = 0;
for i = 1:n
    for j = 1:n
        sig_est_X2 = sig_est_X2 + X(i,j)^2;
    end
end
sig_est_X2 = sig_est_X2 / (n^2);

%calcul de kappa
kappa_est_X = 0;
for i = 1:n
    for j = 1:n
        kappa_est_X = kappa_est_X + X(i,j)^4;
    end
end
kappa_est_X = kappa_est_X / (sig_est_X2^2 * n^2);

%Estimation de beta
syms cbeta
eqn = kappa_est_X == gamma(1/cbeta) * gamma(5/cbeta) / (((gamma(3/cbeta))^2));
solx = solve(eqn, cbeta);

Beta = solx;






end

