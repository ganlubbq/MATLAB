clear all; close all; clc;
global Tb Ts c


Tb=0.07;
Ts=0.0001;
c=Tb/Ts;

N=10;

x=bitstr(N);
X=zero2negone(x);
[e,o]=demux(X);
et=kron(e,ones(c,1));
ot=kron(o,ones(c,1));


t=Ts:Ts:length(et)*Ts;
t=t';
fc=2/Tb;
s1=et.*cos(2*pi*fc*t);
s2=ot.*sin(2*pi*fc*t);

s=s1+s2;


p=(s(c:2*c)).^2;
sig_power=(1/2*Tb)*integral(p);
noise_power=sig_power/(10^(-10/10));
noise=(noise_power/sqrt(2))*randn(1,length(s));
y=s+noise';


z=zeros(1,length(x)/c-1);
ec=cos(2*pi*fc*t);
even=s.*ec;
oc=sin(2*pi*fc*t);
odd=s.*oc;
j=1;
for i=1:c:length(even)-c
    z(j)=integral(even(i:i+c-1))>0;
    j=j+2;
end
j=2;
for i=1:c:length(even)
    z(j)=integral(odd(i:i+c-1))>0;
    j=j+2;
end
x-z'
figure (1)
subplot(2,1,1); plot(et)
subplot(2,1,2); plot(s1)


