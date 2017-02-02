function [ MDLQ ] = compute_MDLQ( Y, m, delta, sigma_est, T, bta, sigma_X)
%Voir équation 31
% il s'agit du truc à minimiser
MDLQ = 0;
n = size(Y,1);
Xq_est = compute_Xq_est( Y, m, delta, T, bta, sigma_X );
y_Xq = (Y - Xq_est).^2;
MDLQ = sum(y_Xq(:));
MDLQ = MDLQ /(2*sigma_est*sigma_est * log10(2));

MDLQ = MDLQ + compute_L(Y, m, delta, T);
        


end

