clc
clear all
close all
I = imread('Barcode.tif');
R =input('Enter the value of R : ');
w = input('Enter the window size : ');
f = double(I);
[x1,~]=size(I);
figure(1);
imshow(I);
title('Original Image');
y1 =1840;
f1 = zeros(x1+2.*w,y1+2.*w);
f1(w+1:x1+w,w+1:y1+w)=f(:,1:y1);
[newx1,newy1]=size(f1);
img = zeros(newx1,newy1);
for i=1:newx1
    for j=1:newy1
        lim1 = w-1+i;
        lim2 = w-1+j;
        if lim1<newx1 && lim2<newy1
        N = f1(i:w-1+i, j:w-1+j);
        sigma(i,j)=std(N(:));
        m(i,j)=mean(N(:));
        t(i,j)= m(i,j).*(1+0.34.*((sigma(i,j)./R)-1));
        if f1(i,j)<=t(i,j)
            img(i,j)=0;
        else
            img(i,j)=255;
        end
        end
    end
