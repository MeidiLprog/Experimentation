clc;
close all;
clear;
%%References built
T = tools();
S = signals();

Fe = 1000;
f = 50;
A = 10;

Tmax = 1 /f;
nbOSCI = 3;

t = 0:1/Fe:Tmax * nbOSCI;

x = S.sinusoid(t,f,"sin");
T.tempoGraph(t,x);
[W,P] = T.EGraph(t,x);

disp("Energy = " + W);
disp("Average Power = " + P);

%%door part:
tdoor = 0:1/Fe:4;
xD = S.door(tdoor,2,2,1);
T.tempoGraph(tdoor,xD);

[Wdoor,Pdoor] = T.EGraph(tdoor,xD);
disp("Door function E:" + Wdoor);
disp("Door function power:" + Pdoor);


