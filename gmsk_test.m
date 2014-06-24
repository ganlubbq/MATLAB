clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;

N=10;

x=bitstr(N);
X=zero2negone(x);




xt=gmsk_pulseshaping(X);
xint=gmsk_integrate(xt)*Ts;
xf=gmsk_filter(xint);
[gI,gO]=gmsk_quad(xf);
[gIc,gOc]=gmsk_carriers(gI,gO);
g=gIc-gOc;



[Ir,Qr]=gmsk_quad_rx(g);
k=gmsk_arctan(Ir,Qr);
y=gmsk_du(k);


figure(1)
plot(xf)
axis([-inf,inf,-1.5,1.5]);
title ('filtered bitstream')


figure(2)
subplot(2,1,1)
plot(gmsk_pulseshaping(x))

axis([-inf,inf,-1.5,1.5]);
title ('input bitstream')
subplot(2,1,2)
plot(k)
axis([-inf,inf,-1.5,1.5]);
title ('signal before du')