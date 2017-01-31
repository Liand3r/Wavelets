function [ Xq_est ] = compute_Xq_est( Y, m, delta, T, bta, sigma_X )

%calcul des niveaux


n = size(Y, 1);
Xq_est = zeros(n, n);
gammas = zeros(2*m+1,1);
b = T;
bl = T + delta;
for i = 1:m
    gammas(i + m + 1) = compute_gamma_l(b, bl, sigma_X, bta);
    gammas(m + 1 - i) = (-1) * gammas(i + m + 1);
    b = b + delta;
    bl = bl + delta;
end

%Quantization des coefficients

for i = 1:n
    for j = 1:n
        if abs(Y(i,j)) < T
            Xq_est(i,j) = 0;
        else
            if Y(i,j) < 0
                id = m+1;
                borne = (-1) * T;
                while (Y(i,j) < borne) && (id > 1)
                    borne = borne - delta;
                    id = id -1;
                end
                Xq_est(i,j) = gammas(id);
                
                
            end
            if Y(i,j) > 0
                id = m+1;
                borne = T;
                while (Y(i,j) > borne) && (id < 2*m+1)
                    borne = borne + delta;
                    id  = id +1;
                end
                Xq_est(i,j) = gammas(id);
            end
            
        end
    end
end

end

