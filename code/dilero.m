function [fin]=dilero(x)

clc;

se1=strel('line',3.9999,0);

x = imerode(x,se1);
x = imdilate(x,se1);
fin = x;
figure(), imshow(x), title('Line Tracked, Eroded and Dilated');
 
 
 