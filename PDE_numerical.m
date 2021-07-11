clear all, close all, clc

%%
dx = 0.01;
L = 20;
x = -L/2:dx:L/2-dx;
f = 0*x;
f = sech(x);
plot(x,f);

DATA = zeros(length(f), 100);
dt = 0.025;
for k = 1:100
    t = k*dt;
    [t,y] = ode45(@(t,y)rhs(t,y,L),[0 dt],f);
    f(:) = y(end,:);
    plot(x,real(f));
    axis([-10,10,-1.5,1.5])
    pause(0.01);
    % DATA(:,k) = real(f);
end

function duout = rhs(t,u,L)
    Nx = length(u);
    uhat = fft(u);
    kap = (2*pi/L) * [-Nx/2:Nx/2-1];
    kap = fftshift(kap');
    duhat = 1i * kap .* uhat;
    dduhat = -(kap.^2).*uhat;
    du = ifft(duhat);
    ddu = ifft(dduhat);
    duout = -u.*du + 0.05*ddu;
end