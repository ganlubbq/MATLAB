clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.0001;
c=Tb/Ts;

N=1000;

x=bitstr(N);
X=zero2negone(x);
[mI,mO]=eye_diag(X);

Tb=0.07;
Ts=0.001;


[E,O]=gmsk_filter(x);
[gI,gO]=gmsk_carriers(E,O);

plot(mI,mO,'bo',gI,gO,'rx-')