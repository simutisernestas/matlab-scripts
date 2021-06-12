clear all, close all, clc 

w = 2*pi;
d = 0.6;

A = [0 1; -w^2 -2*d*w];

dt = 0.1;
T = 10; % time to integrate
 
x0 = [1,0];

% iterate forward Euler scheme
xF(:,1) = x0;
tF(1) = 0;
for k=1:T/dt
    tF(k+1) = k*dt;
    xF(:,k+1) = (eye(2) + A * dt) * xF(:,k);
end
plot(tF, xF(1,:), 'b')
hold on

%%
% iterate backward Euler scheme
xB(:,1) = x0;
tB(1) = 0;
for k=1:T/dt
    tB(k+1) = k*dt;
    xB(:,k+1) = inv(eye(2) - A*dt) * xB(:,k);
end
plot(tB, xB(1,:), 'r')


%% try ode45

[t,x] = ode45(@(t,x) A*x, 0:dt:T, x0);
plot(t,x(:,1), 'g')