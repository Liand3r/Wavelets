function [ newY] = VisuShrink( Y , sig_est)

M = size(Y,1)*size(Y,2);
T=   sig_est*sqrt(2*log10(M));
newY = soft_thresh(Y,T);

end

