function[features] = extractFeaturesFunc(input)

resized = imresize(input, [25 25]);

output = [];

% Loop over all 5x5 sub matrices of resized

for j=1:5:25;
    for k=1:5:25;
        sub = resized(j:j+4, k:k+4);
        feature = mean(mean(sub));
        output = vertcat(output, feature);
    end
end

features = output;