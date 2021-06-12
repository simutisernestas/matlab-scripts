clear all, close all, clc

% Lorenz's params
sigma = 10;
beta = 8/3;
rho = 28;

y0 = [-8;8;27];

dt = .01;
tspan = 0:dt:20;

Y(:,1) = y0;
yk = y0;
for i=1:length(tspan)
    time = i*dt;
    ykplus1 = rk4singlestep(@(t,y)lorenz_sys(t,y,sigma,beta,rho), dt, time, yk);
    Y = [Y ykplus1];
    yk = ykplus1;
end

plot3(Y(1,:), Y(2,:), Y(3,:))
hold on
[t,y] = ode45(@(t,y)lorenz_sys(t,y,sigma,beta,rho),tspan,y0);
plot3(y(:,1), y(:,2), y(:,3), 'r')

function dy = lorenz_sys(t,y,sigma,beta,rho)
% y is a three dimensional state-vector

dy = [
    sigma*(y(2)-y(1));
    y(1)*(rho-y(3)) - y(2);
    y(1)*y(2) - beta*y(3);
];

end

function yout = rk4singlestep(fun, dt, tk, yk)

f1 = fun(tk,yk);
f2 = fun(tk+dt/2,yk+(dt/2)*f1);
f3 = fun(tk+dt/2,yk+(dt/2)*f2);
f4 = fun(tk+dt,yk+dt*f3);

yout = yk + (dt/6)*(f1+f2+f3+f4);

end
