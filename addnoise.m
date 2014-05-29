function y=addnoise(sig,snr)

Tb=0.01;
Ts=0.0001;
c=Tb/Ts;

x=abs((sig(c:2*c))^2);
sig_power=(1/2*Tb)*integral(x);
noise_power=sig_power*(10^(10*snr));
noise=noise_power*rand(1,length(sig));
y=sig+noise;
end


%m=length(x);
%y=x+randn(1,m);

