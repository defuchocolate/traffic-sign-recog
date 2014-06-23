function[features] = extractFeaturesFunc(input)

try
    input = rgb2gray(input)
end

% try
%     input = edge(input);
% catch me
%     [p q r] = size(input);
%     if r == 3
%         input = edge(rgb2gray(input));
%     else
%         disp('Error');        
%     end
%     
% end
sep = 20;
size_im = 100;

output = [];
resized = imresize(input, [size_im size_im]);

% Loop over all sepxsep sub matrices of resized

for j=1:sep:size_im;
    for k=1:sep:size_im;        
        sub = resized(j:j+sep-1, k:k+sep-1);
        
        feature = mean(mean(sub));
     
        output = vertcat(output, feature);
    end
end

features = output;