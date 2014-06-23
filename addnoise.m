function y=addnoise(sig,snr)
% adds White Gaussian to to match the input SNR

global Tb Ts c

%Tb=0.01;
%Ts=0.0001;
%c=Tb/Ts;

%signal power calculation using Parsevals theorem
x=(sig(c:2*c)).^2;
sig_power=(1/2*Tb)*integral(x);
%noise power calculation
noise_power=sig_power/(10^(snr/10));
noise=(noise_power/sqrt(2))*randn(1,length(sig));
%noise addition
y=sig+noise;
end


%m=length(x);
%y=x+randn(1,m);

