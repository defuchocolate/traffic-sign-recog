function [fin]=dilero(x);
clc;

se1=strel('line',3.9999,0);


fin1=imerode(x,se1);
fin=imdilate(fin1,se1);
figure();
imshow(fin);title('line tracked erode then dilated');
 
 
 