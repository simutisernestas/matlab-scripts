clear all, close all, clc
 
L = 100;
H = 100;
u = zeros(L,H);
 
% BCs
u(1,:) = 0;
u(L,:) = 0;
u(:,1) = 1;
u(:,H) = 1;

% diff BCs
u(:,1) = 0.75;
u(:,H) = sin(2*pi*(1:L)/L);

x = 0:1:L-1;
y = 0:1:H-1;
[X,Y] = meshgrid(x);

s = surf(X,Y,u);
 
dtalfa = 1.0;

iterations = 0;
while(iterations < 10000)
    iterations = iterations + 1;
     
    Lu = del2(u); % Laplacian
    u(2:L-1,2:H-1) = u(2:L-1,2:H-1) + dtalfa * Lu(2:L-1,2:H-1);
     
    if (mod(iterations,100) == 0)
        s.ZData = u;    % replace surface z values
        pause(0.05)     % pause to control animation speed
    end
end
 