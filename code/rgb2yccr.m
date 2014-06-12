clc;
clear all;
img=imread('art12.jpg');
img1=rgb2ycbcr(img);
img2=img1(:,:,2);
img3=img1(:,:,3);

subplot(221);imshow(img);title('rgb');
subplot(222);imshow(img1);title('ycbcr');
subplot(223);imshow(img2);title('blue plane ');
subplot(224);imshow(img3);title('red plane');