clc
clear all
close all
I = imread('Barcode.tif');
figure(1);
imshow(I);
title('Original Image');
f = double(I);
[x1,y1]=size(I);
figure(2);
imhist(I);
title('Otsu Threshold');
T = otsuthresh(histcounts(I,-0.5:255.5));
hold on
plot(255*[T T], ylim, 'r', 'LineWidth', 2)
hold off
counts = imhist(I);
L = length(counts);
p = counts / sum(counts);
p1 = cumsum(p);
m = cumsum(p .* (1:L)');
mg = m(end);
 
var_b = ((p1.*((mg-m).^2))./(1-p1));
var_b = var_b ./ max(var_b);
counts = counts ./max(counts);
figure(4);
plot(counts)
hold on;
plot(var_b)
xlim([1 256])
for i = 1:length(var_b)
    if var_b(i) == max(var_b)
        k =i;
    end
end
sprintf('The value of k is %0.1f',k)
y1 =1840;
new_img=zeros(x1,y1);
for i=1:x1
    for j=1:y1
        if f(i,j)>k
            new_img(i,j)=255;
        end 
    end
end
figure(5);
imshow((new_img));
title('Otsu Threshold Image');

