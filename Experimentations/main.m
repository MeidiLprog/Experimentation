clc;
close all;
clear;
%%References built
T = tools();
S = signals();

Fe = 10000;
f = 50;
A = 10;

t = 0:1/Fe:1;

x = S.sinusoid(t,"sin");
T.tempoGraph(t,x);
[W,P] = T.EGraph(t,x);

disp("Energy = " + W);
disp("Average Power = " + P);