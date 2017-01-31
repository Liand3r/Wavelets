function [ gamma_l ] = compute_gamma_l( bl, bl1, sigma_x, beta )
<<<<<<< HEAD

% h = (bl1 - bl)/100;
% den = 0;
% num = 0;
% X = bl;
% funden = @(x, sig, beta) (beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) ) * exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x))^beta);
% funnum = @(x, sig, beta) x *(beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) )* exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x))^beta);
% for i = 1:99
%     X = X + h;
%     den = den + h * mean(funden(X,sigma_x, beta), funden(X-h, sigma_x, beta));
%     num = num + h * mean(funnum(X,sigma_x, beta), funnum(X-h, sigma_x, beta));
% end
% display(num);
% display(den);

fun = @(x, sig, beta) (beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) ) * exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x)).^beta);
den = integral(@(x)fun(x,sigma_x, beta),bl,bl1);


fun = @(x, sig, beta) x *(beta * sig * sqrt(gamma(3/beta)/gamma(1/beta)) / (2*gamma(1/beta)) );%* exp( ( sig * sqrt(gamma(3/beta)/gamma(1/beta)) * abs(x))^beta);
num = integral(@(x)fun(x,sigma_x, beta),bl,bl1);
gamma_l = num/max(den, 0.0001);

end

