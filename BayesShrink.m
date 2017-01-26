function [ newY ] = BayesShrink( Y, L )

N= size(Y,1);
%-------------------Treshold des coefficients
%------Calcul du seuil T
%Calcul de sig_est

HH1 = Y((N/2)+1:N,(N/2)+1:N) ;
l = zeros(N*N/4, 1);
for i = 1:N/2
    for j = 1:N/2
        l(j + (i-1)*N/2) = abs(HH1(i,j));     
    end
end
l = sort(l);
sig_est = median(l)/0.6475
%Calcul et application du seuil pour chaque subband
for i = 1:L
  N2i = N/ (2^i);
  N2i1 = N/(2^(i-1));
  %Traitement de HH_i
  HH_i = Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) ;
  T = compute_thresh(HH_i , sig_est);
  HH_i = soft_thresh(HH_i,T);
  Y( N2i + 1 : N2i1 , N2i + 1 : N2i1) = HH_i;
  % Traitement de LH_i
  LH_i = Y( 1 : N2i , N2i + 1 : N2i1) ;
  T = compute_thresh(LH_i , sig_est);
  LH_i = soft_thresh(LH_i,T);
   Y( 1 : N2i , N2i + 1 : N2i1) = LH_i ;
  %Traitemetn de HL_i
  HL_i = Y( N2i + 1 : N2i1 , 1:N2i) ;
  T = compute_thresh(HL_i , sig_est);
  HL_i = soft_thresh(HL_i,T);
  Y( N2i + 1 : N2i1 , 1:N2i) = HL_i ;     
 end

newY = Y;
end

