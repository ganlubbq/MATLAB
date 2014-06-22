function [Ic,Qc]=gmsk_carriers(I,Q)
global Ts Tb
fc=2/Tb;
t=0:Ts:(length(I))*Ts;
ec=cos(2*pi*fc*t);
oc=sin(2*pi*fc*t);

Ic=I.*ec;
Qc=Q.*oc;
end