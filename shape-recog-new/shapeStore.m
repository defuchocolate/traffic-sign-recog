clc;
clear all;
close all;

files = dir('D:\matlab\project\shape-recog\shapeTestingCircle\*.jpg');

cd 'D:\matlab\project\shape-recog\shapeTestingCircle';

[p q] = size(files);

output1 = [];

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
    
    output1 = horzcat(output1, outfeat);    
end

files = dir('D:\matlab\project\shape-recog\shapeTestingTriangle\*.jpg');

cd 'D:\matlab\project\shape-recog\shapeTestingTriangle';

[p q] = size(files);

output2 = [];

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
    
    output2 = horzcat(output2, outfeat);    
end

% files = dir('D:\matlab\project\shape-recog\shapeTestingTriangle2\*.jpg');
% 
% cd 'D:\matlab\project\shape-recog\shapeTestingTriangle2';
% 
% [p q] = size(files);
% 
% output3 = [];
% 
% for i=1:p;
%     
%     nm = files(i, 1).name;
%     
%     disp(nm);
%     
%     input = imread(nm);
%     
%     resized = imresize(input, [25 25]);
%     
%     outfeat = [];
%     
%     % Loop over all 5x5 sub matrices of resized
%     
%     for j=1:5:25;
%         for k=1:5:25;
%             sub = resized(j:j+4, k:k+4);
%             feature = mean(mean(sub));            
%             outfeat = vertcat(outfeat, feature);
%         end
%     end
%     
%     output3 = horzcat(output3, outfeat);    
% end

% Construct the target vector

[r p] = size(output1);
[r q] = size(output2);
% [r d] = size(output3);

target1 = vertcat(ones([1 p]), zeros([1 p])); %, zeros([1 p]));
target2 = vertcat(zeros([1 q]), ones([1 q])); %, zeros([1 q]));
% target3 = vertcat(zeros([1 d]), zeros([1 d]), ones([1 d]));

output = horzcat(output1, output2); %, output3);
target = horzcat(target1, target2); %, target3);

% Construct the sample
% The sample is circular and thus should have class 1
sampler = imread('D:\matlab\project\shape-recog\shapeTestingTriangle2\narrow_bridge.jpg');
sampler3 = extractFeaturesFunc(sampler);