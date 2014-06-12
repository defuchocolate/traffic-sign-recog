function [out_red, out_blue] = roi(x)

clc;
clear all;
img = x(:,:);

img1 = rgb2ycbcr(img);

% Extract the red and blue components

blue_comp=img1(:,:,2); % blue component
red_comp=img1(:,:,3); % red component

% convert the red and blue components to binary

% find the Otsu threshold value

blue_thresh = graythresh(blue_comp);
red_thresh = graythresh(red_comp);

blue_thresh = blue_thresh * 255;
red_thresh = red_thresh * 255;

% create the binary images

blue_comp_bin = blue_comp;
red_comp_bin = red_comp;

blue_comp_bin(blue_comp_bin > blue_thresh) = 1;
blue_comp_bin(blue_comp_bin < blue_thresh) = 0;

red_comp_bin(red_comp_bin > red_thresh) = 1;
red_comp_bin(red_comp_bin < red_thresh) = 0;

%% defining a filter H for getting region of interest here wherever the value
%% in blue_comp=1 the region is obtained

H = [255];
roib = roifilt2(H, blue_comp, blue_comp_bin);
roir = roifilt2(H, red_comp, red_comp_bin);

roib(roib > blue_thresh) = 255;
roib(roib < blue_thresh) = 0;

roir(roir > red_thresh) = 255;
roir(roir < red_thresh) = 0;

% Displaying all the images

figure();imshow(img);title('original image');
figure();
subplot(221);imshow(blue_comp);title('blue plane');
subplot(222);imshow(red_comp);title('red plane');
subplot(223);imshow(blue_comp_bin,[]);title('threshold blue plane ');
subplot(224);imshow(red_comp_bin,[]);title('threshold red plane');
figure();
subplot(121);imshow(roib);title('region of interest blue');
subplot(122);imshow(roir);title('region of interest red');

finr=dilero(roir);
finb=dilero(roib);

figure();
subplot(121);imshow(finb);title('region of interest dilated and eroded blue');
subplot(122);imshow(finr);title('region of interest dilated and eroded red');

fin_red = cat(3,finr,finr,finr);
fin_blue = cat(3,finb,finb,finb);

out_red = fin_red;
out_blue = fin_blue;

if(size(fin_red)~=0)
    blob(fin_red);
end

if(size(fin_blue)~=0)
    blob(fin_blue);
end