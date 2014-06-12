clear all;
clc;
fontSize=14;
rgbImage = imread('par.jpg');
% Get the dimensions of the image.  numberOfColorBands should be = 3.
[rows columns numberOfColorBands] = size(rgbImage);
% Display the original color image.
subplot(2, 2, 1);
imshow(rgbImage, []);
axis on;
title('Original Color Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0, 0, 1, 1]);
% Let's get our template by extracting a small portion of the original image.
templateWidth = 50;
templateHeight = 50;
smallSubImage = imcrop(rgbImage, [192, 82, templateWidth, templateHeight]);
subplot(2, 2, 2);
imshow(smallSubImage, []);
axis on;
title('Template Image to Search For', 'FontSize', fontSize);
% Ask user which channel to search for a match.
% channelToCorrelate = menu('Correlate which color channel?', 'Red', 'Green', 'Blue');
% It actually finds the same location no matter what channel you pick, 
% for this image anyway, so let's just go with red (channel #1).
channelToCorrelate = 1;  
correlationOutput = normxcorr2(smallSubImage(:,:,1), rgbImage(:,:, channelToCorrelate));
subplot(2, 2, 3);
imshow(correlationOutput, []);
axis on;
title('Normalized Cross Correlation Output', 'FontSize', fontSize);
% Find out where the normalized cross correlation image is brightest.
[maxCorrValue, maxIndex] = max(abs(correlationOutput(:)));
[yPeak, xPeak] = ind2sub(size(correlationOutput),maxIndex(1));
% Because cross correlation increases the size of the image, 
% we need to shift back to find out where it would be in the original image.
corr_offset = [(xPeak-size(smallSubImage,2)) (yPeak-size(smallSubImage,1))];
% Plot it over the original image.
subplot(2, 2, 4); % Re-display image in lower right.
imshow(rgbImage);
axis on; % Show tick marks giving pixels
hold on; % Don't allow rectangle to blow away image.
% Calculate the rectangle for the template box.  Rect = [xLeft, yTop, widthInColumns, heightInRows]
boxRect = [corr_offset(1) corr_offset(2) templateWidth, templateHeight]
% Plot the box over the image.
rectangle('position', boxRect, 'edgecolor', 'g', 'linewidth',2);
% Give a caption above the image.
title('Template Image Found in Original Image', 'FontSize', fontSize);