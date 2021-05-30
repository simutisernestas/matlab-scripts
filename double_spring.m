clear all, close all, clc

t = 0:.02:200;

m1 = 10;
m2 = 40;
k1 = 0.4;
k2 = 1.1;

% ------
%   |
%   |
%   \
%   /
%   \
%  ---
% | m |
%  ---
%   |
%   |
%   \
%   /
%   \
%  ---
% | m |
%  ---

x0 = [3;1;0;0];
% variajble reduction making dv/dt = d^2x/dt^2
A = [0 1 0 0;
    -(k1+k2)/m1 0 k2/m1 0;
    0 0 0 1
    k2/m2 0 -k2/m2 0];

[t,x] = ode45(@(t,x) A*x,t,x0);
plot(t,x(:,1))
hold on
