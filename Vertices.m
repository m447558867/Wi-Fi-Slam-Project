clc
clear all
im = imread( 'C:\Users\BILL4\Desktop\1.png '); 
I=rgb2gray(im);
points = detectHarrisFeatures(I);
strongest = selectStrongest(points,17);
imshow(I);
hold on;
plot(strongest);
strongest.Location