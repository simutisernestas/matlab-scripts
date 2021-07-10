clear all;
close all;
clc

N = 1001;
L = 8*pi;
dx = L/(N-1);
x = -L/2:dx:L/2-dx;
f = cos(x).*exp(-x.^2/25);
% analytical derivative
df = -(sin(x).*exp(-x.^2/25) + (2/25)*x.*cos(x).*exp(-x.^2/25));
plot(x,df,'k')
Nx = length(x);

hold on

%% approximate by finite difference
for k = 1:length(f)-1
    dfFD(k) = (f(k+1)-f(k))/dx;
end
dfFD(end+1) = dfFD(end);
plot(x,dfFD,'r')


%% fft derivative
% fft(df) = i*w*fft(f)
% df = ifft(fft(df))
% only works for smooth functions!!!
fhat = fft(f);
kap = (2*pi/L*[-Nx/2:Nx/2-1]);
kap = fftshift(kap);
dfhat = 1i*kap.*fhat;
dfFFT = ifft(dfhat);
plot(x,dfFFT,'b')