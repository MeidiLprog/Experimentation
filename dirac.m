clc;
clear;
close all;

%% Parameters

f = 5;              % Frequency of sinusoid
Fe = 1000;          % Numerical sampling frequency
dt = 1/Fe;          % Numerical time step

t = 0:dt:1;

A = 3;


%% Sinusoid

x = Sinusoide(f,t,A);

graphtemp(t,x,"Original sinusoid");


%% Simple Dirac

t0 = 1/4;

delta = Dirac(t,t0,dt);

graphtemp(t,delta,"Dirac");


%% Convolution : x(t) * delta(t-t0)

y = Convolution(x,delta,dt);

% Length of convolution:
% Nx + Nh - 1
ty = 0:dt:(length(y)-1)*dt;

graphtemp(ty,y,"Convolution x(t) * delta(t-t0)");


%% Dirac Comb

Te = 0.05;           % Distance between two Dirac impulses
Fe_sample = 1/Te;    % Sampling frequency of the comb

comb = DiracComb(t,Te,dt);

graphtemp(t,comb,"Dirac comb");


%% Ideal sampling : x(t) * Dirac Comb
% Here .* means PRODUCT, not convolution

xSampled = x .* comb;

graphtemp(t,xSampled,"Sampled signal");

disp("Sampling frequency of the Dirac comb = " + Fe_sample + " Hz");


%% FUNCTIONS

function x = Sinusoide(f,t,A)

    x = A*cos(2*pi*f*t);

end


function delta = Dirac(t,t0,dt)

    delta = zeros(size(t));

    index = (t == t0);

    delta(index) = 1/dt;

end


function comb = DiracComb(t,Te,dt)

    comb = zeros(size(t));

    tmin = min(t);
    tmax = max(t);

    kmin = ceil(tmin/Te);
    kmax = floor(tmax/Te);

    for k = kmin:kmax

        t0 = k*Te;

        comb = comb + Dirac(t,t0,dt);

    end

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


function graphtemp(t,x,titleText)

    figure;

    plot(t,x,'LineWidth',1.5);

    xlabel("Time (s)");
    ylabel("Amplitude");
    title(titleText);

    grid on;

end