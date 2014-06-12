clc;
clear all;

input = imread('D:\project-images\test1.jpg');

[red_comp, blue_comp] = roi(input);

figure;
subplot(1,2,1),imshow(red_comp), title('Red component');
subplot(1,2,2), imshow(blue_comp), title('Blue component');

blob(red_comp, input);
blob(blue_comp, input);