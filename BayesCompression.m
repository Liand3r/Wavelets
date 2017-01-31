
function [ newY ] = BayesCompression( Y, L, sig_est )


N= size(Y,1);

%pour chaque subband on : 
% Calcule le seuil
% estime sig_Y^2
% caclule les constantes de la GGD
%  softthresh
%  on cherche m et delta qui minimise MDLQ sur la subband
%  On quantize la subband
% faut que j'aille dormir.
for i = 1:L
    display(L);
    N2i = N/ (2^i);
    N2i1 = N/(2^(i-1));
    %Traitement de HH_i
    display('HHi');
    HH_i = Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) ;
    
    T = compute_thresh(HH_i , sig_est);
    sig_est_Y2 = compute_sig_est_Y2(HH_i);
    bta = compute_beta(HH_i, sig_est_Y2, sig_est);    
    % HH_i = soft_thresh(HH_i,T);
    sig_X = sqrt(max(sig_est_Y2 - sig_est * sig_est, 0));
    [m, delta] = minimizeMDLQ(HH_i,T, sig_est_Y2, sig_est, sig_X, bta);
    HH_i = compute_Xq_est(HH_i, m, delta, T, bta, sig_X); 
    Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) = HH_i;
    % Traitement de LH_i
    display('LHi');
    LH_i = Y( 1 : N2i , N2i + 1 : N2i1);
    T = compute_thresh(LH_i , sig_est);
    sig_est_Y2 = compute_sig_est_Y2(LH_i);
    bta = compute_beta(LH_i, sig_est_Y2, sig_est);
    % LH_i = soft_thresh(LH_i,T);
    sig_X = sqrt(max(sig_est_Y2 - sig_est * sig_est, 0));
    [m, delta] = minimizeMDLQ(LH_i,T, sig_est_Y2, sig_est, sig_X, bta);
    LH_i = compute_Xq_est(LH_i, m, delta, T, bta, sig_X); 
    Y( 1 : N2i , N2i + 1 : N2i1) = LH_i ;
    %Traitemetn de HL_i
    display('HLi');
    HL_i = Y( N2i + 1 : N2i1 , 1:N2i) ;
    T = compute_thresh(HL_i , sig_est);
    sig_est_Y2 = compute_sig_est_Y2(HL_i);
    sig_est_Y2 = 900;
    bta = compute_beta(HL_i, sig_est_Y2, sig_est);
    % HL_i = soft_thresh(HL_i,T);
    sig_X = sqrt(max(sig_est_Y2 - sig_est * sig_est, 0));
    [m, delta] = minimizeMDLQ(HL_i,T, sig_est_Y2, sig_est, sig_X, bta);
    HL_i = compute_Xq_est(HL_i, m, delta, T, bta, sig_X); 
    Y( N2i + 1 : N2i1 , 1:N2i) = HL_i ;
end

newY = Y;
end


