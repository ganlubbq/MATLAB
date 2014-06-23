function [I,Q]=gmsk_quad(x)
global Tb
I=cos(pi*x/(2*Tb));
Q=sin(pi*x/(2*Tb));
end