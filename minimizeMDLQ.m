function  [m, delta] = minimizeMDLQ(Y,T, sig_est_Y2, sig_est,sig_X, bta)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

MDLQ = Inf;
MDLQprec = Inf;
m = 1;
maxY = max(max(abs(Y)));


while MDLQprec >= MDLQ && m<100
    delta_inf = maxY/m+5;
    delta_sup = maxY/(m-0.5);
    h = (delta_sup - delta_inf)/30;
    MDLQs = zeros(30,1);
    i = 1;
    for i = 1:30
        MDLQs(i) = compute_MDLQ(Y, m, delta_inf + (i-1) * h, sig_est, T,bta, sig_X);
        
    end
    MDLQprec = MDLQ;
    MDLQ = min(MDLQs);
    
    m = m+1
    
        
end

if m  == 100
    display('il y a peut-être un probleme')
end
%on a m, maintenant, on retrouve delta

md = Inf;
for j = 1:30
    if MDLQs(j) < md
        i = j;
        md = MDLQs(j);
    end
end
delta_inf = maxY/m+5;
delta_sup = maxY/(m-0.5);
delta = delta_inf + (j-1) * (delta_sup - delta_inf)/30;


end

