function [I,Q]=gmsk_quad(x)
% Calculate the baseband quadrature components of gmsk
global Tb
% The signal after the gaussian filter is used as a phase of cosine and
% sine functions 
I=cos(pi*x/(2*Tb));
Q=sin(pi*x/(2*Tb));
end