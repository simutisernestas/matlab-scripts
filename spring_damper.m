clear all, close all, clc

w = 2*pi; % natural freq
d = 0.25 * 10; % damping

A = [0 1; -w^2 -d];

dt = 0.01;
T = 10;

x0 = [2; 0];
[t,x] = ode45(@(t,x) A*x, 0:dt:T, x0);

