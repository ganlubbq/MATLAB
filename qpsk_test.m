clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;

N=10;

x=bitstr(N);
X=zero2negone(x);
[e,o]=demux(X);





[qI,qQ]=qpsk_quad(X);

qpsk=qI+qQ;

[rI,rQ]=qpsk_quad_rx(qpsk);
y=qpsk_du(rI,rQ);
[erx,orx]=demux(y);




figure(1)

subplot(2,1,1)
plot(qpsk_pulseshaping(e))
axis([-inf,inf,-1.5,1.5]);
title ('even bitstream')
subplot(2,1,2)
plot(qI)
title ('inphase component')

figure(2)
subplot(2,1,1)
plot(qpsk_pulseshaping(x))

axis([-inf,inf,-1.5,1.5]);
title ('input bitstream')
subplot(2,1,2)
plot(qpsk_pulseshaping(y))
axis([-inf,inf,-1.5,1.5]);
title ('bitstream after demodulator')