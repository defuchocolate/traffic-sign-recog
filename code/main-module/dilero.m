function [fin]=dilero(x)

clc;

se1=strel('line',3.9999,0);

x = imerode(x,se1);
x = imdilate(x,se1);
fin = x;
reply = askuser('Display all the dislate-erode related figures?', 'Query');
if(strcmpi(reply, 'Yes'))
    figure(), imshow(x), title('Line Tracked, Eroded and Dilated');
end