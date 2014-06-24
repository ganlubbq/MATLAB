function [Irx,Qrx]=qpsk_quad_rx(s)
% extraction of qpsk quadrature components

global Tb Ts c
fc=2/Tb
t=Ts:Ts:length(s)*Ts;
% multiplying by carriers
Irx=s.*cos(2*pi*fc*t);
Qrx=s.*sin(2*pi*fc*t);