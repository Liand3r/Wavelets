function [ MDLQ ] = compute_MDLQ( Y, m, delta, sigma_est)

MDLQ = 0;
Xq_est = compute_Xq_est(Y, m, delta);
for i = 1:n
    for j = 1:n
        MDLQ = (Y(i,j) - Xq_est(i,j))^2;
    end
end
MDLQ = MDLQ /(2*sigma_est*sigma_est * log10(2));

MDLQ = MDLQ + compute_L(Y, m, delta, T);
        


end

