clc;
close all;
clear;

%% References built

T = tools();
S = signals();

Fe = 1000;
dt = 1/Fe;

f = 50;
A = 10;

Tmax = 1/f;
nbOSCI = 3;

%% Sinusoid part

t = 0:dt:Tmax*nbOSCI;

x = S.sinusoid(t,f,"sin");

T.tempoGraph(t,x);

[W,P] = T.EGraph(t,x);

disp("Energy = " + W);
disp("Average Power = " + P);


%% Door part

tdoor = 0:dt:4;

xD = S.door(tdoor,2,2,1);
    
T.tempoGraph(tdoor,xD);

[Wdoor,Pdoor] = T.EGraph(tdoor,xD);

disp("Door function E: " + Wdoor);
disp("Door function power: " + Pdoor);


%% Triangle part

ttriangle = 0:dt:4;

Atriangle = 2;
t0triangle = 2;
Ttriangle = 2;

xTriangle = S.Triangle(ttriangle,Atriangle,t0triangle,Ttriangle);

T.tempoGraph(ttriangle,xTriangle);

[Wtriangle,Ptriangle] = T.EGraph(ttriangle,xTriangle);

disp("Triangle function E: " + Wtriangle);
disp("Triangle function power: " + Ptriangle);


%% Convolution : Door * Door

Tconv = 1;
Aconv = 1;

% We want each door to be defined on [0,Tconv]
tDoorConv = 0:dt:Tconv;

% Since Door() is centered around t0:
% t0 - T/2 = 0
% t0 + T/2 = T
% therefore t0 = T/2
t0conv = Tconv/2;

x1 = S.door(tDoorConv,Aconv,t0conv,Tconv);
x2 = S.door(tDoorConv,Aconv,t0conv,Tconv);

% Display the two doors
T.tempoGraph(tDoorConv,x1);
T.tempoGraph(tDoorConv,x2);

% Homemade convolution
yconv = S.Convolution(x1,x2,dt);

% Time axis of convolution
tconv = 0:dt:(length(yconv)-1)*dt;

% Display convolution result
T.tempoGraph(tconv,yconv);