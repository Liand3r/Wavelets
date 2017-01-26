function [Y] = soft_thresh(X, T  )
N = size(X,1);
Y = zeros(N,N);
for i = N/16+1:N
    for j =N/16+1:N
        Y(i,j) = sign(X(i,j)) * max( abs(X(i,j)) - T, 0);
    end
end

end

