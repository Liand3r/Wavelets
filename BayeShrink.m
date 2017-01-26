
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
F = imread('lena512.bmp');
G = imnoise(F, 'gaussian', 0, 0.001);
imwrite(G, 'doublelena.bmp')
%figure, imshow(F), 
figure, imshow(G)

G = double(G);
[N,J] = dyadlength(G);
display(J)
%Calcul des coefficients d'ondelette
qmf = MakeONFilter('Daubechies',6) ;
L=J-4;
Y = FWT2_PO(G, L, qmf);

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
% for i = 1:L
%     for j = 1:3
%  SubBand = zeros(N/(2^i), N/(2^i)); 
%  %Calcul de sig_est_Y2
  T = compute_thresh(HH1, sig_est);
%  %Soft-treshold sur les coefficients
  Y((N/2)+1:N,(N/2)+1:N) = soft_thresh(HH1,T);
%     end
% end

X = IWT2_PO(Y, L, qmf);
X = uint8(X);
figure, imshow(X)




