
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
F = imread('lena512.bmp');
X = double(F);
G = imnoise(F, 'gaussian', 0, 0.0035);
imwrite(G, 'doublelena.bmp')

figure;
title('Image bruitée')
imshow(G), 

G = double(G);
[N,J] = dyadlength(G);
display(J)
%Calcul des coefficients d'ondelette

qmf = MakeONFilter('Daubechies',4) ;
L=J-2;

Y = FWT2_PO(G, L, qmf);
%Débruitage
sig_est = compute_sig_est(Y);
YbH = BayesShrinkHard(Y,L,sig_est);
Yb = BayesShrink(Y,L, sig_est);
Yv = VisuShrink(Y, sig_est);

%Transformée inverse pour Baye
Xb = IWT2_PO(Yb, L, qmf);

%Transformée inverse pour Bayes HT
XbH = IWT2_PO(YbH, L, qmf);

%Transformée inverse pour VisuShrink
Xv = IWT2_PO(Yv, L, qmf);

n = compute_MSE(X, G);
b = compute_MSE(X, Xb);
bH = compute_MSE(X, XbH);
v = compute_MSE(X,Xv);
display(n)
display(b)
display(bH)
display(v)


Xv = uint8(Xv);
Xb = uint8(Xb);
XbH = uint8(XbH);

figure;
imshow(Xv)
figure;
imshow(Xb)
figure;
imshow(XbH)




