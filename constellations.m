clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.0001;
c=Tb/Ts;

N=100;

x=bitstr(N);
X=zero2negone(x);
[e,o]=demux(X);
[mI,mO]=halfsins(e,o);

Tb=0.07;
Ts=0.001;

xt=gmsk_pulseshaping(x);
xint=gmsk_integrate(xt);
xf=gmsk_filter(xint);
[gI,gO]=gmsk_quad(xf);
t=-Tb:Ts:((length(mI)-1-c)*Ts);




figure(1)
plot(mI,mO,'bo',gI,gO,'rx-')
legend ('MSK', 'GMSK')
title('Constellation diagrams')