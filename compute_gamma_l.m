function [ gamma_l ] = compute_gamma_l( bl, bl1, sigma_x, beta )

beta = double(beta);
h = (bl1 - bl)/100;
den = 0.00000001;
num = 0;
X = bl;
funden = @(x, sig, beta) (beta * sig * sqrt(gamma(3/beta)/gamma(1/beta))/ (2*gamma(1/beta)) ) * exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta))* abs(x))^beta);
funnum = @(x, sig, beta) x *(beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) ) * exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x)).^beta);



for i = 1:50
    X = X + h;
    den = den + h * 0.5 *(funden(X,sigma_x, beta) +funden(X-h,sigma_x, beta) );
    num = num + h * 0.5 * (funnum(X,sigma_x, beta) + funnum(X-h, sigma_x, beta));
end

gamma_l = num/den;
if isnan(gamma_l)
   gamma_l = bl1 - bl; 
end

end

