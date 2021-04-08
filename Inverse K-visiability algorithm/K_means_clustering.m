clc
clear all
he = imread('C:\Users\Frankzaizai\Desktop\Capstone\test3.png');
lab_he = rgb2lab(he);
ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 4;
% repeat the clustering 3 times to avoid local minima
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',5);
figure(1);
imshow(pixel_labels,[])
%title('Image Labeled by Cluster Index');
