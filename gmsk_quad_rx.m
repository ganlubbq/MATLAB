function [I,Q]=gmsk_quad_rx(s)
% Extracts the quadrature components from the received signal
global Ts Tb
fc=2/Tb;

t=Ts:Ts:length(s)*Ts;
% multiplying by carriers
I=s.*cos(2*pi*fc*t);
Q=s.*sin(2*pi*fc*t);


[b,a]=butter(2,0.5*pi*fc*Ts); % butterworth low pass filter

% Filter out the signals
Irx=filtfilt(b,a,I);
Qrx=filtfilt(b,a,Q);