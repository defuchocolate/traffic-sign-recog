clc;
clear all;
close all;

tic;

[output, target] = extractClass();

net = create_net(output, target);

input = imread('D:\project-images-test\test1.jpg');

[red_comp, blue_comp] = roi(input);

[numRed, blobsRed, shapesRed] = blob(red_comp, input);
[numBlue, blobsBlue, shapesBlue] = blob(blue_comp, input);

size_blob = 100;

[p q y] = size(blobsRed);
[r t y] = size(blobsBlue);

disp('Red');
count = 1;
figure;

for i=1:100:q-100+1;
    thisB = blobsRed(:, i:i+99, :);
    sampler = extractFeaturesFunc(rgb2gray(thisB));
    temp = sim(net, sampler);
    disp(temp.');
    a = temp.';
    class = 0;
    
    y = max(a);
    
    if y == a(1)
        class = 1;
    elseif y == a(2)
        class = 2;
    else
        class = 3;
    end
    
    subplot(3, 4, count);
    imshow(thisB);
    caption = sprintf('Class %d\nCoeff: %0.4f', class, y);
    title(caption, 'FontSize', 10);
    
    count = count + 1;
    
    if(count > 12)        
        figure;
        count = 1;
    end
    
end

disp('Blue');
figure;
count = 1;

for i=1:100:t-100+1;
    thisB = blobsBlue(:, i:i+99, :);
    sampler = extractFeaturesFunc(rgb2gray(thisB));
    temp = sim(net, sampler);
    disp(temp.');
    a = temp.';
    class = 0;
    
    y = max(a);
    
    if y == a(1)
        class = 1;
    elseif y == a(2)
        class = 2;
    else
        class = 3;
    end
    
    subplot(3, 4, count);
    imshow(thisB);
    caption = sprintf('Class %d\nCoeff: %0.4f', class, y);
    title(caption, 'FontSize', 10);
    
    count = count + 1;
    
    if(count > 12)        
        figure;
        count = 1;
    end
    
end

elapsedTime = toc;
message = sprintf('Blobs from \nRed: %d\nBlue: %d\nElapsed time: %.2f\nClass 1: Circle non-prohibitory\nClass 2: Circle, prohibitory\nClass 3: Traingle', numRed, numBlue, elapsedTime);
questdlg(message, 'Information', 'Yes');