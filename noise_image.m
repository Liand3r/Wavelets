function [] = noise_image(infile, outfile, m, s)
I = imread(infile);
J = imnoise(I,'gaussian',m,s);
imwrite(J, outfile);
end
