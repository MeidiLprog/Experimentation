clc;
clear;
close all;

f = 50;

Fe = 100;
dt = 1/Fe;

t = 0:dt:1;

A = 3;

x = Sinusoide(f,t,A);

graphtemp(t,x);


%% Dirac

t0 = 1/4;

delta = Dirac(t,t0,dt);

graphtemp(t,delta);


function x = Sinusoide(f,t,A)

    x = A*cos(2*pi*f*t);

end


function delta = Dirac(t,t0,dt)

    delta = zeros(size(t));

    index = (t == t0);

    delta(index) = 1/dt;

end


function graphtemp(t,x)

    figure;

    plot(t,x,'LineWidth',1.5);

    xlabel("time(s)");
    ylabel("Amplitude(V)");
    title("Displaying in temporal domain");

    grid on;

end