function y=addnoise(sig,snr)

global Tb Ts c

%Tb=0.01;
%Ts=0.0001;
%c=Tb/Ts;

x=(sig(c:2*c)).^2;
sig_power=(1/2*Tb)*integral(x);
noise_power=sig_power/(10^(snr/10));
noise=(noise_power/sqrt(2))*randn(1,length(sig));
y=sig+noise;
end


%m=length(x);
%y=x+randn(1,m);

