clc;
%First try a simple one � feedforward (multilayer perceptron) network
net=newff([0 2], [5,1], {'tansig','purelin'},'trainlm');
% Here newff defines feedforward network architecture.

% The first argument [0 2] defines the range of the input and initializes the network parameters.
% The second argument the structure of the network. There are two layers.
% 5 is the number of the nodes in the first hidden layer,
% 1 is the number of nodes in the output layer,
% Next the activation functions in the layers are defined.
% In the first hidden layer there are 5 tansig functions.
% In the output layer there is 1 linear function.
% �learngd� defines the basic learning scheme � gradient method
% Define learning parameters
net.trainParam.show = 50; % The result is shown at every 50th iteration (epoch)
net.trainParam.lr = 0.05; % Learning rate used in some gradient schemes
net.trainParam.epochs =1000; % Max number of iterations
net.trainParam.goal = 1e-3; % Error tolerance; stopping criterion
%Train network

[p q] = size(output);

for i=1:p;
    temp = output(:, i).';
    temp_tar = target(:, i);
   net1 = train(net, temp, temp_tar); % Iterates gradient type of loop
end