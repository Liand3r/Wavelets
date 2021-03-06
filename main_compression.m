%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Lecture de l'image
close all;
clear;
F = imread('lena512.bmp');
X = double(F);
G = imnoise(F, 'gaussian', 0, 0.01);
imwrite(G, 'doublelena.bmp')

figure;
title('Image bruitée')
imshow(G), 

G = double(G);
%[N,J] = dyadlength(G);
N = size(G,1);
J = log2(N);
display(J)
%Calcul des coefficients d'ondelette

qmf = MakeONFilter('Daubechies',4) ;
%Voir papier
L = 4;

Y = FWT2_PO(G, L, qmf);
%Débruitage
sig_est = compute_sig_est(Y);

%Denoise + compression Bayeshrink
[ X_hatQ] = BayesCompression( Y, L, sig_est );

X_est = real(IWT2_PO(X_hatQ, L, qmf));
%recherche de m et delta correct
imshow(X_est)
disp(compute_MSE(X, X_est));
disp(compute_MSE(double(G), X));