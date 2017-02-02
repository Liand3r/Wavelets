function  [m, delta] = minimizeMDLQ(Y,T, sig_est_Y2, sig_est,sig_X, bta)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

MDLQ = Inf;
MDLQprec = Inf;
m = 2;
maxY = max(max(abs(Y)));

delta_var = 15;
MDLQs = zeros(delta_var,1);
while MDLQprec >= MDLQ && m<8
    delta_inf = maxY/(m+5);
    delta_sup = maxY/(m-1.5);
    MDLQsprec = MDLQs;
    h = (delta_sup - delta_inf)/delta_var;
    
    for i = 1:delta_var
        MDLQs(i) = compute_MDLQ(Y, m, delta_inf + (i-1) * h, sig_est, T,bta, sig_X);      
    end
    MDLQprec = MDLQ;
    MDLQ = min(MDLQs);
    
    m = m+1; 
end
display(m);
m = m-1;
%une fois m fixé, on recherche le delta qui minimise la hcose
i = 0;

for j = 1:delta_var
    valmin = min(MDLQsprec);
    i = 1;
    while(MDLQsprec(i) ~= valmin) && (i<10)
        i = i+1;
    end
end
delta = delta_inf + (i-1) * h;


end

