function [flag]=shape(x)

cd 'D:\matlab\project\code\main-module\shape-images\';

% Flag
%
% 1 - Circle
% 2 - Octagon
% 3 - Triangle
% 4 - Rectangle

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

c = zeros([1 10]);

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

o = zeros([1 2]);

o(1)=cortem(oct,x);
o(2)=cortem(oct1,x);

TRI = zeros([1 3]);

TRI(1)=cortem(tri,x);
TRI(2)=cortem(trri1,x);
TRI(3)=cortem(trri2,x);

a = zeros([1 7]);

% Circle

a(1)=max(c);
a(2)=cortem(cir,x);
a(3)=cortem(cirrr,x);

% Rectangle
a(4)=cortem(rec,x);

% Triangle
a(5)=cortem(itri,x);
a(6)=max(TRI);

% Octagon
a(7)=max(o);

disp(a);

b=max(a);

flag=0;

if ( b==a(1) || b==a(2) || b == a(3))
    disp('CIRCLE');
    flag=1;
elseif b == a(7)
    disp('OCTAGON');
    flag=2;
elseif ( b == a(5)|| b == a(6) )
    disp('TRIANGLE');
    flag=3;
elseif b == a(4)
    disp('RECTANGLE');
    flag=4;
else
    disp('Unable to identify shape.');
end