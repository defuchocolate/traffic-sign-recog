clc;
clear all;
img=imread('test7.jpg');
filt=fspecial('gaussian',7,10);
img2=imfilter(img,filt);
for i=1:1:3
    img3(:,:,i)=histeq(img(:,:,i));
end
for i=1:1:3
    img1(:,:,i)=medfilt2(img(:,:,i));
end

subplot(221);imshow(img);title('original');
subplot(222);imshow(img1);title('median filtered');
subplot(223);imshow(img2);title('gaussian filtered');
subplot(224);imshow(img3);title('hist equalised');

imge=img;
for i=1:1:3
    imge1(:,:,i)=medfilt2(imge(:,:,i));
end
imge2=imfilter(imge1,filt);
for i=1:1:3
    imge3(:,:,i)=histeq(imge2(:,:,i));
end
figure();
subplot(221);imshow(imge);title('original');
subplot(222);imshow(imge1);title('median filtered');
subplot(223);imshow(imge2);title('gaussian filtered');
subplot(224);imshow(imge3);title('hist equalised');