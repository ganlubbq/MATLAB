function [ec,oc]=gmsk_carriers(E,O)

global Tb Ts c



t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
ec=E.*cos(2*pi*fc*t);
oc=O.*sin(2*pi*fc*t);
end