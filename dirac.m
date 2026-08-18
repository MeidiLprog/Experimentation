clc;
clear;
close all;

f = 50;

Fe = 1000;
dt = 1/Fe;

t = 0:dt:1;

A = 3;

%% Sinusoide

x = Sinusoide(f,t,A);

graphtemp(t,x);


%% Dirac

t0 = 1/4;

delta = Dirac(t,t0,dt);

graphtemp(t,delta);


%% Convolution : x(t) * delta(t-t0)

y = Convolution(x,delta,dt);

% Une convolution de deux signaux de longueur N
% produit un signal de longueur 2N-1.
% Il faut donc construire son nouvel axe temporel.

ty = 0:dt:(length(y)-1)*dt;

graphtemp(ty,y);


%% FUNCTIONS

function x = Sinusoide(f,t,A)

    x = A*cos(2*pi*f*t);

end


function delta = Dirac(t,t0,dt)

    delta = zeros(size(t));

    index = (t == t0);

    delta(index) = 1/dt;

end


function y = Convolution(x,h,dt)

    Nx = length(x);
    Nh = length(h);

    y = zeros(1,Nx + Nh - 1);

    for n = 1:Nx + Nh - 1

        for k = 1:Nx

            j = n-k+1;

            if j >= 1 && j <= Nh

                y(n) = y(n) + x(k)*h(j);

            end

        end

    end

    y = y*dt;

end


function graphtemp(t,x)

    figure;

    plot(t,x,'LineWidth',1.5);

    xlabel("time(s)");
    ylabel("Amplitude");
    title("Displaying in temporal domain");

    grid on;

end