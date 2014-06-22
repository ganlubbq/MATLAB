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
t=-Tb:Ts:((length(E)-1-c)*Ts);

ec=E.*cos(pi*t/(2*Tb)); 
oc=O.*sin(pi*t/(2*Tb));
[gI,gO]=gmsk_carriers(ec,oc);
g=gI+gO;
G=fft(g);
M=fft(mI+mO);

figure(1)
plot(mI,mO,'bo',gI,gO,'rx-')
figure(2)
subplot(2,1,1)
plot(abs(G(1000:3000)))
subplot(2,1,2)
plot(abs(M(1000:3000)))