clear all, close all, clc

a = 0;
b = 10;
dx = 0.01;
x = a:dx:b;
f = sin(x);

n = length(x);

area1 = 0;
%left rectangle
for i=1:n-1
 area1 = area1 + dx*f(i);
end


area2 = 0;
%right rectangle
for i=2:n  
 area2 = area2 + dx*f(i);
end


area3 = 0;
%trapezoidal rectangle
for i=1:n-1
 area3 = area3 + (dx/2)*(f(i)+f(i+1));
end
