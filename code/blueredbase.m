clc;
clear all;
img=imread('test1.jpg');
img1=rgb2ycbcr(img);
img2=img1(:,:,2);
img3=img1(:,:,3);
l1=graythresh(img2);
l2=graythresh(img3);
[r1 c1]=size(img2);
[r2 c2]=size(img3);
for i=1:1:r1
    for j=1:1:c1
        img22(i,j)=0;
    end
end
for i=1:1:r2
    for j=1:1:c2
        img33(i,j)=0;
    end
end
for i=1:1:r1
    for j=1:1:c1
        if img2(i,j)>((l1*255)+40)
            img22(i,j)=1;
        else img22(i,j)=0;
        end
    end
end
for i=1:1:r2
    for j=1:1:c2
        if img3(i,j)>((l2*255)+40)
            img33(i,j)=1;
        else img33(i,j)=0;
        end
    end
end
figure();imshow(img);title('original image');
figure();
subplot(221);imshow(img2);title('blue plane');
subplot(222);imshow(img3);title('red plane');
subplot(223);imshow(img22,[]);title('threshold blue plane ');
subplot(224);imshow(img33,[]);title('threshold red plane');