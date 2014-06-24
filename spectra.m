clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;

N=100;

x=bitstr(N);
X=zero2negone(x);
[e,o]=demux(X);
[mI,mO]=msk_carriers(X);
msk=mod_test(mI,mO);



xt=gmsk_pulseshaping(x);
xint=gmsk_integrate(xt)*Ts;
xf=gmsk_filter(xint);
[gI,gO]=gmsk_quad(xf);
[gIc,gOc]=gmsk_carriers(gI,gO);
g=gIc+gOc;
t=-Tb:Ts:((length(mI)-1-c)*Ts);
[qI,qQ]=qpsk_quad(X);

qpsk=qI+qQ;


G=fft(g,7000);
M=fft(msk,7000);
Q=fft(qpsk,7000);

df=1/(Ts*7000);
f=0:7000-1;
f=f*df;
figure(1)
title ('comparison of spectra')
subplot(3,1,1)
plot(f,10*log10(abs(Q)))
title ('QPSK')
subplot(3,1,2)
plot(f,10*log10(abs(M)))
title ('MSK')
subplot(3,1,3)
plot(f,10*log10(abs(G)))
title ('GMSK')