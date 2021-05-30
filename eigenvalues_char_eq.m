clear all, close all, clc

t = 0:.02:10;

% lambda1 = -1; lambda2 = 2;
x = exp(-t) + exp(-2*t);
plot(t,x,'k');
hold on

y0 = [2;-3];
% eigenvalues as lambdas: -1;2 :)
A = [0 1;
    -2 -3;];

t = 0:1:10;

[t,y] = ode45(@(t,y) A*y,t,y0);
plot(t,y(:,1))


