clear all, close all, clc

L = 100;
N = 1001;
dx = L/(N-1);
x = -L/2:dx:L/2-dx;
f = 0*x;
f((L/2-L/10)/dx:(L/2+L/10)/dx) = 1;
plot(x,f);
a = 10;
y = x;
dt = .1;

for k=1:100
   t = k*dt;
   for j=1:length(x)
      xi = x(j) - y;
      g = (1/(2*a*sqrt(pi*t))) * exp(-xi.^2/(4*a*a*t));
      u(j) = dot(g,f)*dx;
   end
   plot(x,u,'k');
   pause(0.1);
end

%% fft version
fhat = fft(f);
for k=1:100
   t = k*dt;
   Nx = max(size(f));
   kappa = 2*pi/L*[0:Nx/2-1 0 -Nx/2+1:-1];
   uhat = fhat.*exp(-(a^2)*t*kappa.^2);
   u = ifft(uhat);
   plot(x,u,'k');
   pause(0.1);
end