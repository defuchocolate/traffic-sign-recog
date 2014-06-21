clc;
clear all;
close all;

tic;

[output, target] = extractClass();

net = create_net(output, target);

input = imread('D:\project-images-test\tester3.jpg');

[red_comp, blue_comp] = roi(input);

[numRed, blobsRed, shapesRed] = blob(red_comp, input);
[numBlue, blobsBlue, shapesBlue] = blob(blue_comp, input);

size_blob = 100;

[p q y] = size(blobsRed);
[r t y] = size(blobsBlue);

disp('Red');
c = 1;

for i=1:100:q-100;
    thisB = blobsRed(:, i:i+100, :);
    sampler = extractFeaturesFunc(edge(rgb2gray(thisB)));
    temp = sim(net, sampler);
    disp(temp.');
end

disp('Blue');

for i=1:100:t-100;
    thisB = blobsBlue(:, i:i+100, :);
    sampler = extractFeaturesFunc(edge(rgb2gray(thisB)));
    temp = sim(net, sampler);
    disp(temp.');
end

elapsedTime = toc;
message = sprintf('Blobs from \nRed: %d\nBlue: %d\nElapsed time: %.2f', numRed, numBlue, elapsedTime);
questdlg(message, 'Information', 'Yes');