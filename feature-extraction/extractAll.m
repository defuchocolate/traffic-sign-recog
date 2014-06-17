clc;
clear all;
close all;

files = dir('D:\project-images-test\*.jpg');

cd 'D:\project-images-test';

[p q] = size(files);

output = [];

for i=1:p;
    
    nm = files(i, 1).name;
    
    disp(nm);
    
    input = imread(nm);
    
    resized = imresize(input, [25 25]);
    
    outfeat = [];
    
    % Loop over all 5x5 sub matrices of resized
    
    for j=1:5:25;
        for k=1:5:25;
            sub = resized(j:j+4, k:k+4);
            feature = mean(mean(sub));            
            outfeat = vertcat(outfeat, feature);
        end
    end
    
    output = horzcat(output, outfeat);    
end

target = [1 1 1 1 1 0 0 0 0; 0 0 0 0 0 1 1 1 1];