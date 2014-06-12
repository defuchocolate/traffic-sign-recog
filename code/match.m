clear all;
clc;
x=imread('art2.jpg');
cir=imread('tempc.jpg');
cir1=imread('tempci.jpg');
oct=imread('tempo.jpg');
rec=imread('temprr.jpg');
itri=imread('tempti.jpg');
tri=imread('tempttt.jpg');
cirr=imread('tempccc.jpg');
for i=1:1:7
    a(i)=0;
end
a(1)=cortem(cir1,x);
a(2)=cortem(cir,x);
a(3)=cortem(oct,x);
a(4)=cortem(rec,x);
a(5)=cortem(itri,x);
a(6)=cortem(tri,x);
a(7)=cortem(cirr,x);
b=max(a);
if b==a(1)
        disp('CIRCLE');
    elseif b==a(2)
        disp('CIRCLE');
    elseif b==a(7)
        disp('CIRCLE');
    elseif b==a(3)
        disp('OCTAGON');
    elseif b==a(4)
        disp('RECTNGLE');
    elseif b==a(5)||b==a(6)
        disp('TRIANGLE');
    else disp('not able to identify soorrry');
    end
    
