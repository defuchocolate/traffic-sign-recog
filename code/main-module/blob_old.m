function []=blob(x)
%input must be a rgb image

tic; % Start timer.

% Read in standard MATLAB demo image
x=rgb2gray(x);
originalImage = x;
subplot(3, 3, 1);
imshow(originalImage);
% Maximize the figure window.
set(gcf, 'Position', get(0, 'ScreenSize'));
% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Original image.');
title(caption);
axis square; % Make sure image is not artificially stretched because of screen's aspect ratio.

% Threshold the image to get a binary image (only 0's and 1's) of class "logical."
% Method #1: using im2bw()
%   normalizedThresholdValue = 0.4; % In range 0 to 1.
%   thresholdValue = normalizedThresholdValue * max(max(originalImage)); % Gray Levels.
%   binaryImage = im2bw(originalImage, normalizedThresholdValue);       % One way to threshold to binary
% Method #2: using a logical operation.
thresholdValue = 254;
binaryImage = originalImage > thresholdValue; % Bright objects will be the chosen if you use >.
%   binaryImage = originalImage < thresholdValue; % Dark objects will be the chosen if you use <.

% Do a "hole fill" to get rid of any background pixels inside the blobs.
binaryImage = imfill(binaryImage, 'holes');

% Display the binary image.
subplot(3, 3, 3); imagesc(binaryImage); colormap(gray(256)); title('Binary Image, obtained by thresholding'); axis square;

labeledImage = bwlabel(binaryImage, 8);     % Label each blob so we can make measurements of it
coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % pseudo random color labels

subplot(3, 3, 4);
imshow(labeledImage, []);
title('Labeled Image, from bwlabel()');
axis square;
subplot(3, 3, 5);
imagesc(coloredLabels);
axis square;
caption = sprintf('Pseudo colored labels, from label2rgb().\nBlobs are numbered from top to bottom, then from left to right.');
title(caption);

% Get all the blob properties.  Can only pass in originalImage in version R2008a and later.
blobMeasurements = regionprops(labeledImage, originalImage, 'all');
numberOfBlobs = size(blobMeasurements, 1);

% bwboundaries() returns a cell array, where each cell contains the row/column coordinates for an object in the image.
% Plot the borders of all the coins on the original grayscale image using the coordinates returned by bwboundaries.
subplot(3, 3, 6); imagesc(originalImage);
title('Outlines, from bwboundaries()'); axis square;
hold on;
boundaries = bwboundaries(binaryImage);
numberOfBoundaries = size(boundaries);
for k = 1 : numberOfBoundaries
    thisBoundary = boundaries{k};
    plot(thisBoundary(:,2), thisBoundary(:,1), 'g', 'LineWidth', 2);
end
hold off;

fontSize = 14;	% Used to control size of "blob number" labels put atop the image.
labelShiftX = -7;	% Used to align the labels in the centers of the coins.
blobECD = zeros(1, numberOfBlobs);
% Print header line in the command window.
fprintf(1,'Blob #      Mean Intensity  Area   Perimeter    Centroid       Diameter\n');
% Loop over all blobs printing their measurements to the command window.
for k = 1 : numberOfBlobs           % Loop through all blobs.
    % Find the mean of each blob.  (R2008a has a better way where you can pass the original image
    % directly into regionprops.  The way below works for all versions including earlier versions.)
    thisBlobsPixels = blobMeasurements(k).PixelIdxList;  % Get list of pixels in current blob.
    meanGL = mean(originalImage(thisBlobsPixels)); % Find mean intensity (in original image!)
    meanGL2008a = blobMeasurements(k).MeanIntensity; % Mean again, but only for version >= R2008a
    
    blobArea = blobMeasurements(k).Area;		% Get area.
    blobPerimeter = blobMeasurements(k).Perimeter;		% Get perimeter.
    blobCentroid = blobMeasurements(k).Centroid;		% Get centroid.
    blobECD(k) = sqrt(4 * blobArea / pi);					% Compute ECD - Equivalent Circular Diameter.
    fprintf(1,'#%2d %17.1f %11.1f %8.1f %8.1f %8.1f % 8.1f\n', k, meanGL, blobArea, blobPerimeter, blobCentroid, blobECD(k));
    % Put the "blob number" labels on the "boundaries" grayscale image.
    text(blobCentroid(1) + labelShiftX, blobCentroid(2), num2str(k), 'FontSize', fontSize, 'FontWeight', 'Bold');
end

% Put the labels on the rgb labeled image also.
subplot(3, 3, 5);
for k = 1 : numberOfBlobs           % Loop through all blobs.
    blobCentroid = blobMeasurements(k).Centroid;		% Get centroid.
    text(blobCentroid(1) + labelShiftX, blobCentroid(2), num2str(k), 'FontSize', fontSize, 'FontWeight', 'Bold');
end


elapsedTime = toc;
% Alert user that the demo is done and give them the option to save an
% image.

message = sprintf('Finished running BlobsDemo.m.\n\nElapsed time = %.2f seconds.\n\n Would you like to crop out each blob to individual images?', elapsedTime);
reply = questdlg(message, 'Extract Individual Images?', 'Yes', 'No', 'Yes');

% Note: reply will = '' for Upper right X, 'Yes' for Yes, and 'No' for No.
if strcmpi(reply, 'Yes')
    figure;
    % Maximize the figure window.
    set(gcf, 'Position', get(0, 'ScreenSize'));
    count = 1;
    for k = 1 : numberOfBlobs           % Loop through all blobs.
        blobArea = blobMeasurements(k).Area;
        if(blobArea>1000)
            % Find the bounding box of each blob.
            thisBlobsBoundingBox = blobMeasurements(k).BoundingBox;  % Get list of pixels in current blob.
            % Extract out this coin into it's own image.
            subImage = imcrop(originalImage, thisBlobsBoundingBox);
            % Display the image with informative caption.
            subplot(3, 4, count);               
            imshow(subImage);
            count = count + 1;
            if(count > 12)                
                figure;                
            end
            [r1 c1]=size(subImage);
            caption = sprintf('BLOB #%d length=%d breadth=%d', k,r1,c1);
            title(caption, 'FontSize', 14);
        end
    end
end