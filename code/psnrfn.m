function psn=psnrfn(x,y)
figure();
subplot(121);imshow(x);
subplot(122);imshow(y);
net=0;
[r1 c1]=size(x);
[r2 c2]=size(y);
r=min(r1,r2);
c=min(c1,c2);
for i=1:1:c
    for j=1:1:r
        c(i,j)=x(i,j)-y(i,j);
        c(i,j)=c(i,j)*c(i,j);
        net=net+c(i,j);
    end
end
net=double(net);
disp(net);
psn=10*log((255*255)/net);
disp('psnr=');disp(psn);