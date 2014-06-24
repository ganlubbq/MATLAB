function y=gmsk_filter(x)
% Passes the input signal through a gaussian filter

global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;
fc=2/Tb;

sigma=sqrt(log(2))/2*pi*0.3; %BT set to 0.5 which is used in real systems
n=-12:12; % filter length
hg=1/(sqrt(2*pi)*sigma*Tb)*exp(((-n.*Ts).^2)/2*sigma^2*Tb^2); % filter response
w=blackman(length(n));
hw=1.5*hg.*w'; % multiplying by window

y=filtfilt(hg,1,x);
end