clear all, close all, clc

A = [0 1; -1 -.1];
B = [0;1];
C = eye(2);
D = [0;0];

sys = ss(A,B,C,D);


impulse(sys, 100);

%% tirangle shaped signal
t=0:.01:50;
u = 0*t;
u(1001:2000) = (1:1000)/10000;
u(2001:3000) = (1000-(1:1000))/10000;
plot(t,u)
lsim(sys,u,t)