function [I,Q]=qpsk_quad(x)
global Tb Ts c

[e,o]=demux(c);
et=qpsk_pulseshaping(e);
ot=qpsk_pulseshaping(o);

t=Ts:Ts:length(et)*Ts;
t=t';
fc=2/Tb;
I=et.*cos(2*pi*fc*t);
Q=ot.*sin(2*pi*fc*t);
end
