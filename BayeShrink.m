
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
F = imread('lena512.bmp');
G = imnoise(F, 'gaussian', 0, 0.01);
imwrite(G, 'doublelena.bmp')
%figure, imshow(F), figure, imshow(G)

G = double(G);
[N,J] = dyadlength(G);
%Calcul des coefficients d'ondelette
qmf = MakeONFilter('Daubechies',8) ;
L=J-4;
Y = FWT2_PO(G, L, qmf);

%-------------------Treshold des coefficients
%------Calcul du seuil T
%Calcul de sig_est
HH1 = zeros(N/2, N/2);
l = zeros(N*N/4, 1)
for i = 1:N/2
    for j = 1:N/2
        HH1(i,j) = G(i+N/2, j+N/2);
        c = abs(G(i+N/2, j+N/2));
        l(j + (i-1)*N/2) = c;
        
    end
end
l = sort(l);
sig_est = median(l)/0.6475;
%Calcul de sig_est_Y2
sig_est_Y2 = 0
for i = 1:N/2
    for j = 1:N/2
        sig_est_Y2 = sig_est_Y2 + HH1(i,j) * HH1(i,j);
        
    end
end
sig_est_Y2 = sig_est_Y2 * 4 / (N * N);
%calcul de sig_est_X et du seuil T
if (sig_est_Y2 > sig_est * sig_est):
    sigma_est_X = sqrt(sig_est_Y2 - sig_est * sig_est);
    T = sigma_est * sigma_est / sigma_est_X;
else
    sigma_est_X = 0;
    T = max(list);
end

%Soft-treshold sur les coefficients





X = IWT2_PO(Y, L, qmf);
X = uint8(X);
figure, imshow(X)




