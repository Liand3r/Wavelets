
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
F = imread('lena512.bmp');
G = imnoise(F, 'gaussian', 0, 0.015);
imwrite(G, 'doublelena.bmp')

figure;
title('Image bruitée')
imshow(G), 

G = double(G);
[N,J] = dyadlength(G);
display(J)
%Calcul des coefficients d'ondelette
qmf = MakeONFilter('Daubechies',10) ;
L=J-4;
Y = FWT2_PO(G, L, qmf);
%Débruitage
Yb = BayesShrink(Y,L, sig_est);
Yv = VisuShrink(Y, sig_est);

%Transformée inverse pour Bayes
Xb = IWT2_PO(Yb, L, qmf);
Xb = uint8(Xb);
%Transformée inverse pour VisuShrink
Xv = IWT2_PO(Yv, L, qmf);
Xv = uint8(Xv);

%Affichage de Bayes
figure ;
title('Bayes')
imshow(Xb)


%Affichage de VisuShrink
figure ;
title('Visu')
imshow(Xv) 





