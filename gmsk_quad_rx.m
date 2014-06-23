function [I,Q]=gmsk_quad_rx(s)
% Extracts the quadrature components from the received signal
global Ts Tb
fc=2/Tb;

% multiplying by carriers
s1=s.*ec;
s2=s.*oc;


[b,a]=butter(2,0.5*pi*fc*Ts); % butterworth low pass filter

% Filter out the signals
Irx=filtfilt(b,a,s1);
Qrx=filtfilt(b,a,s2);