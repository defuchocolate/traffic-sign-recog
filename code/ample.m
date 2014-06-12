clear all;
a=imread('lena.png');
b=imnoise(a,'salt & pepper',0.02);
y=psnrfn(a,b);
disp('psnr=');disp(y);