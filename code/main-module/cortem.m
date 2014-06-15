function [value]=cortem(x,y)

x=im2bw(x);
y=im2bw(y);
[r1 c1]=size(x);
[r2 c2]=size(y);

if r1>r2
    z=imresize(x,size(y));
    value=max(corr2(z,y));
else
    z=imresize(y,[r1 c1]);
    value=max(corr2(x,z));
end