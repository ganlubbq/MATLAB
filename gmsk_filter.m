function y=gmsk_filter(x)

global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;
fc=2/Tb;

sigma=sqrt(log(2))/2*pi*0.5;
n=-80:80;
hg=1/(sqrt(2*pi)*sigma*Tb)*exp(((-n.*Ts).^2)/2*sigma^2*Tb^2);
w=blackman(length(n));
hw=0.075*hg.*w';

y=filtfilt(hw,1,x);
end