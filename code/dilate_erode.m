clear all;
clc;
x=imread('lena.png');
se=strel('ball',5,5);
se1=strel('line',25,5);
x1=imdilate(x,se);
x2=imdilate(x,se1);
x3=imerode(x,se);
x4=imerode(x,se1);
fin1=imdilate(x,se);
fin=imerode(fin1,se1);
figure();
subplot(231);imshow(x);, title('Original');
 subplot(232);imshow(x1);, title('Dilated ball');
 subplot(233);imshow(x2);title('dilated line');
 subplot(234);imshow(x3);title('erode ball');
 subplot(235);imshow(x4);title('erode line');
 subplot(236);imshow(fin);title('ball tracked');
 
 
 