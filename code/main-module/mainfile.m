clc;
% clear all;
close all;

% cd 'D:\project-images\signs';

input = imread('D:\project-images-test\tester5.jpg');

% input = lucyrich(input);

[red_comp, blue_comp] = roi(input);

% figure;
% subplot(1,2,1),imshow(red_comp), title('Red component');
% subplot(1,2,2), imshow(blue_comp), title('Blue component');

[numRed, blobsRed, shapesRed] = blob(red_comp, input);
[numBlue, blobsBlue, shapesBlue] = blob(blue_comp, input);

message = sprintf('Blobs from \nRed: %d\nBlue: %d', numRed, numBlue);
questdlg(message, 'Information', 'Okay');

% if(numRed == 1 && numBlue == 1)
%     figure, imshow(blobsRed), title('Extracted from Red');
%     figure, imshow(blobsBlue), title('Extracted from Blue');
% elseif(numRed == 1)
%     figure, imshow(blobsRed), title('Extracted from Red');
%     extracted = blobsRed;
% elseif(numBlue == 1)
%     figure, imshow(blobsBlue), title('Extracted from Blue');
%     extracted = blobsBlue;
% elseif(numBlue > 4)
%     % Red is important
%     [p q r] = size(blobsRed);
%     for i=1:3:r;
%         temp = blobsRed(:, :, i:i+2);
%         figure, imshow(temp);
%     end
% elseif(numRed > 4)
%     % Blue is important
%     [p q r] = size(blobsBlue);
%     for i=1:3:r;
%         try
%             temp = blobsBlue(:, :, i:i+2);
%         end
%         try
%             figure, imshow(temp);
%         end
%     end
% end
