clear all, close all, clc
x = -10:.01:10;
y = sin(x);
plot(x,y,'k','LineWidth',2);
axis([-10 10 -10 10]);
grid on, hold on

% First order Taylor expansion
P = [1, 0];
yT1 = polyval(P,x);
plot(x,yT1);

% Third order Taylor expansion
P = [-1/factorial(3) 0 1 0];
yT3 = polyval(P,x);
plot(x,yT3);

% Fifth order Taylor expansion
P = [1/factorial(5) 0 -1/factorial(3) 0 1 0];
yT5 = polyval(P,x);
plot(x,yT5);