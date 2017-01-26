
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
F = imread('lena512.bmp');
G = imnoise(F, 'gaussian', 0, 0.015);
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
%Débruitage
Y = BayesShrink(Y,L);
%Transformée inverse
X = IWT2_PO(Y, L, qmf);
X = uint8(X);
%Affichage
figure, imshow(X)




