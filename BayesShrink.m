function [ newY ] = BayesShrink( Y, L, sig_est )

N= size(Y,1);
%-------------------Treshold des coefficients

%Calcul et application du seuil pour chaque subband
for i = 1:L
  N2i = N/ (2^i);
  N2i1 = N/(2^(i-1));
  %Traitement de HH_i
  HH_i = Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) ;
  %sig_est = compute_sig_est(HH_i);
  T = compute_thresh(HH_i , sig_est);
  HH_i = soft_thresh(HH_i,T);
  Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) = HH_i;
  % Traitement de LH_i
  LH_i = Y( 1 : N2i , N2i + 1 : N2i1) ;
  %sig_est = compute_sig_est(LH_i);
  T = compute_thresh(LH_i , sig_est);
  LH_i = soft_thresh(LH_i,T);
   Y( 1 : N2i , N2i + 1 : N2i1) = LH_i ;
  %Traitemetn de HL_i
  HL_i = Y( N2i + 1 : N2i1 , 1:N2i) ;
 % sig_est = compute_sig_est(HL_i);
  T = compute_thresh(HL_i , sig_est);
  HL_i = soft_thresh(HL_i,T);
  Y( N2i + 1 : N2i1 , 1:N2i) = HL_i ;     
 end

newY = Y;
end

