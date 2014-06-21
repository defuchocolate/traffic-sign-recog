clc;

input = imread('D:\project-images-test\tester4.jpg');
input = double(input);
avg = mean(mean(input));

[p q r] = size(input);
for i=1:r;
    for j=1:p;
        for k=1:q;
            input(i, j, k) = input(i, j, k) - avg;
        end
    end
end

input = input + 100;

imshow(input, []);