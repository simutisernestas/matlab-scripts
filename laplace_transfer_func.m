clear all
close all
clc

d = 5;
k = 4;
s = tf('s');
sys = 1/(s^2+d*s+k);

%%
step(sys);

%%
impulse(sys);

%%
k = 1;
for d =.1:.1:2
    sys = 1/(s^2+d*s+k);
    step(sys)
    pause(0.1)
    hold off
end

%% input to the system
t = 0:.1:100;
u = sin(t) + cos(2.*t);
x = lsim(sys,u,t);
plot(t,x);

%% Bode for changing damping

k = 1;
for d =0:.05:1
    sys = 1/(s^2+d*s+k);
    bode(sys)
    pause(0.1)
    hold off
end

%% recovering magnitude and phase from transfer func G(s)

% copy of regular input
t = 0:.1:100;
u = sin(t) + cos(2.*t);
x = lsim(sys,u,t);
plot(t,x);

w = 1;
s = i*w;
Gofs = 1/(s^2+d*s+k);
mag = abs(Gofs);
phase = angle(Gofs);
u = sin(t+phase) + cos(2.*(t+phase));
hold on
plot(t, mag*u, 'r--');