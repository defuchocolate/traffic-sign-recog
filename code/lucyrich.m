function[luc1]=lucyrich(I)
clc;

PSF = fspecial('gaussian',2,2);
Blurred = imfilter(I,PSF,'symmetric','conv');

luc1 = deconvlucy(Blurred,PSF,2);
figure();
subplot(131);imshow(I);
title('Original Image');
subplot(132); imshow(Blurred);
title('Blurred and Noisy Image');
subplot(133); imshow(luc1);
title('Restored Image');