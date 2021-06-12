clear all


dt = .1;
t = -2:dt:5;
f = sin(t);

dfdt = cos(t);

plot(t,f,'k--','LineWidth',1.2)
hold on
plot(t, dfdt, 'k', 'LineWidth', 3)

%% 
% Forward difference scheme
dfdtF = (sin(t+dt) - sin(t)) / dt;
% Backward difference scheme
dfdtB = (sin(t)-sin(t-dt))/dt;
% Central difference scheme
dfdtC = (sin(t+dt)-sin(t-dt))/(2*dt);

plot(t,dfdtF, 'b')
plot(t,dfdtB, 'r')
plot(t,dfdtC, 'g')

%% From data

close all

x = 0:0.1:3;
f = sin(x);

% add some error to the data
f = f + .05 * rand(size(f));

plot(x,f,'k')
hold on
plot(x,f,'rx')

dx = x(2) - x(1);
n = length(f);

dfdx = zeros(n,1);
dfdx(1) = (f(2)-f(1))/dx;
for i=2:n-1
    dfdx(i) = (f(i+1)-f(i-1))/(2*dx);
end
dfdx(n) = (f(n)-f(n-1))/dx;

% errors are amplified with numerical diff
plot(x,dfdx,'gx')
plot(x,cos(x),'b')
