clear all, close all, clc

dx = 0.005;
L = 2*pi;
x = dx:dx:L;

f = ones(size(x));
f(1:length(x)/2) = 0*f(1:length(x)/2);

% just playin
f = sin(x).*cos(x.^2).*x.^3;

for m = 1:100
    hold off
    plot(x,f)
    % just from definition of An with n = 0;
    A0 = (2/L) * sum(f.*ones(size(x)))*dx;
    fFS = A0/2;
    for n=1:m
        An = (2/L) * sum(f.*cos(2*pi*n*x/L))*dx;
        Bn = (2/L) * sum(f.*sin(2*pi*n*x/L))*dx;
        fFS = fFS + An * cos(2*pi*n*x/L) + Bn * sin(2*pi*n*x/L);
    end
    hold on
    plot(x,fFS,'--r');
    drawnow
    pause(0.1)
end