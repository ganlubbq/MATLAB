function [I,Q]=gmsk_quad_rx(s)
global Ts Tb
fc=2/Tb;

s1=s.*ec;
s2=s.*oc;


[b,a]=butter(2,0.5*pi*fc*Ts);


Irx=filtfilt(b,a,s1);
Qrx=filtfilt(b,a,s2);