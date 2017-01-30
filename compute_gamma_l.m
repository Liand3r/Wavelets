function [ gamma_l ] = compute_gamma_l( bl, bl1, sigma_x, beta )
fun = @(x, sig, beta) (beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) )% * exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x))^beta);
den = integral(@(x)fun(x,sigma_x, beta),bl,bl1);


fun = @(x, sig, beta) x *(beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) )%* exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x))^beta);
num = integral(@(x)fun(x,sigma_x, beta),bl,bl1);
gamma_l = num/max(den, 0.0001);

end

