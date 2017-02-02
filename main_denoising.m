
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
close all;
clear all;
F = imread('lena512.bmp');
%X : image originale, non bruitée
X = double(F);
%On ajoute un bruit de moyenne/var constante 
G = imnoise(F, 'gaussian', 0, 0.01);

%on affiche l'image bruitée
figure;
title('Image bruitée')
imshow(G), 

G = double(G);
N = size(G,1);
J = log2(N);

%Calcul des coefficients d'ondelette
qmf = MakeONFilter('Daubechies',8) ;
L = 4;
Y = FWT2_PO(G, L, qmf);

%DÃ©bruitage
%Calcul de sig_est
HH1 = Y((N/2+1):N , (N/2 + 1):N);
sig_est = compute_sig_est(HH1);

%débruitage par bayeshrink et visushrink
Yb = BayesShrink(Y,L, sig_est);
Yv = VisuShrink(Y, sig_est);

%TransformÃ©e inverse pour Baye
Xb = IWT2_PO(Yb, L, qmf);

%TransformÃ©e inverse pour VisuShrink
Xv = IWT2_PO(Yv, L, qmf);

n = compute_MSE(X, G);
b = compute_MSE(X, Xb);
v = compute_MSE(X,Xv);

display(n)
display(b)
display(v)


Xv = uint8(Xv);
Xb = uint8(Xb);

figure;
imshow(Xv)
figure;
imshow(Xb)





