clear all;
clc;
x=imread('match.JPG');
cir=imread('tempc.jpg');
cir1=imread('tempci.jpg');
cirr1=imread('match.jpg');
cirr2=imread('match1.jpg');
cirr3=imread('match2.jpg');
cirr4=imread('match3.jpg');
cirr5=imread('match4.jpg');
cirr6=imread('match5.jpg');
cirr7=imread('match6.jpg');
cirr8=imread('match8.jpg');
cirr9=imread('match10.jpg');

oct=imread('tempo.jpg');
oct1=imread('match7.jpg');

rec=imread('temprr.jpg');

itri=imread('tempti.jpg');
tri=imread('tempttt.jpg');
trri1=imread('match9.jpg');
trri2=imread('match11.jpg');

cirrr=imread('tempccc.jpg');
for i=1:1:10
    c(i)=0;
end
c(1)=cortem(cir1,x);
c(2)=cortem(cirr1,x);
c(3)=cortem(cirr2,x);
c(4)=cortem(cirr3,x);
c(5)=cortem(cirr4,x);
c(6)=cortem(cirr5,x);
c(7)=cortem(cirr6,x);
c(8)=cortem(cirr7,x);
c(9)=cortem(cirr8,x);
c(10)=cortem(cirr9,x);

for i=1:1:2
    o(i)=0;
end
o(1)=cortem(oct,x);
o(2)=cortem(oct1,x);

for i=1:1:3
TRI(i)=0;
end
TRI(1)=cortem(tri,x);
TRI(2)=cortem(trri1,x);
TRI(3)=cortem(trri2,x);

for i=1:7
    a(i)=0;
end

a(1)=max(c);
a(2)=cortem(cir,x);
a(3)=max(o);
a(4)=cortem(rec,x);
a(5)=cortem(itri,x);
a(6)=max(TRI);
a(7)=cortem(cirrr,x);
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
    
