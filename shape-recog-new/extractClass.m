clc;
% clear all;
close all;

size_im = 100;
sep = 20;

files = dir('D:\matlab\project\shape-recog\shapeTestingCircle\*.jpg');

cd 'D:\matlab\project\shape-recog\shapeTestingCircle';

[p q] = size(files);

output1 = [];

for i=1:p;
    
    nm = files(i, 1).name;
    
    disp(nm);
    
    input = imread(nm);
    
    input = edge(rgb2gray(input));
    
    resized = imresize(input, [size_im size_im]);
    
    outfeat = extractFeaturesFunc(resized);
    
    output1 = horzcat(output1, outfeat);
end

files = dir('D:\matlab\project\shape-recog\shapeTestingCircle2\*.jpg');

cd 'D:\matlab\project\shape-recog\shapeTestingCircle2';

[p q] = size(files);

output2 = [];

for i=1:p;
    
    nm = files(i, 1).name;
    
    disp(nm);
    
    input = imread(nm);
    
    input = edge(rgb2gray(input));
    
    resized = imresize(input, [size_im size_im]);
    
    outfeat = extractFeaturesFunc(resized);
    
    output2 = horzcat(output2, outfeat);
end

files = dir('D:\matlab\project\shape-recog\shapeTestingTriangle\*.jpg');

cd 'D:\matlab\project\shape-recog\shapeTestingTriangle';

[p q] = size(files);

output3 = [];

for i=1:p;
    
    nm = files(i, 1).name;
    
    disp(nm);
    
    input = imread(nm);
    
    input = edge(rgb2gray(input));
    
    resized = imresize(input, [size_im size_im]);
    
    outfeat = extractFeaturesFunc(resized);
    
    output3 = horzcat(output3, outfeat);
end

% Construct the target vector

[r p] = size(output1);
[r q] = size(output2);
[r d] = size(output3);

target1 = vertcat(ones([1 p]), zeros([1 p]), zeros([1 p]));
target2 = vertcat(zeros([1 q]), ones([1 q]), zeros([1 q]));
target3 = vertcat(zeros([1 d]), zeros([1 d]), ones([1 d]));

output = horzcat(output1, output2, output3);
target = horzcat(target1, target2, target3);

% Construct the sample
% The sample is circular and thus should have class 1
% sampler = imread('D:\matlab\project\shape-recog\shapeTestingTriangle2\narrow_bridge.jpg');
% sampler3 = extractFeaturesFunc(sampler);


clc;
%First try a simple one – feedforward (multilayer perceptron) network
net=newff([0 2], [5,1], {'tansig','purelin'},'traingd');
% Here newff defines feedforward network architecture.

% The first argument [0 2] defines the range of the input and initializes the network parameters.
% The second argument the structure of the network. There are two layers.
% 5 is the number of the nodes in the first hidden layer,
% 1 is the number of nodes in the output layer,
% Next the activation functions in the layers are defined.
% In the first hidden layer there are 5 tansig functions.
% In the output layer there is 1 linear function.
% ‘learngd’ defines the basic learning scheme – gradient method
% Define learning parameters
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch)
net.trainParam.lr = 0.05; % Learning rate used in some gradient schemes
net.trainParam.epochs =1000; % Max number of iterations
net.trainParam.goal = 1e-3; % Error tolerance; stopping criterion
%Train network

[p q] = size(output);

i = 1;

% for i=1:p;
    temp = output(:, i).';
    temp_tar = target(:, i).';
    temp_tar = horzcat(temp_tar, zeros([1 22]));
    net1 = train(net, temp, temp_tar); % Iterates gradient type of loop
% end