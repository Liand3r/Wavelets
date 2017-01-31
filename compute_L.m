function [ L] = compute_L( X_est, m, delta, T )
n = size(X_est, 1);
L = 0;
% -m ... 0 ... m
% 1 ... m+1 ... 2m+1
K = zeros(2*m + 1 , 1);
X = X_est;
%Evaluer Kl
for i = 1:n
    for j = 1:n
 
        %normalement, ceux là valent 0 puisqu'ils ont déjà été thresholdés
        %mais on sait jamais
        if abs(X_est(i,j)) < T
            K(m+1) = K(m+1) + 1;
            
        else
            if X_est(i,j) < 0
                id = m+1;
                borne = (-1) * T;
                while (X(i,j) < borne) && (id > 1)
                    borne = borne - delta;
                    id = id -1;
                end
                K(id) = K(id) +1;
                
                
            end
            if X_est(i,j) > 0
                id = m+1;
                borne = T;
                 while (X(i,j) > borne) && (id < 2*m+1)
                    borne = borne + delta;
                    id  = id +1;
                 end
                K(id) = K(id) +1;
            end
        end
        
    end
end

for i = 1:2*m+1
    if (K(i) > 0)
    L = L - K(i) * log(K(i)/(n^2));
    end
end




end

