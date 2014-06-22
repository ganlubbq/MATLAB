
function simBer=BER(N)
global Tb Ts c


Tb=0.07;
Ts=0.0001;
c=Tb/Ts;



x=bitstr(N);
X=zero2negone(x);
[s1,s2]=eye_diag(X);
s=mod_test(s1,s2);

nErr=[];
y=[];
Eb_N0_dB = [-30:10];
R=1/Tb;
Eb_N0=10.^(Eb_N0_dB/20);
snr=Eb_N0/1.2;
SNR=10*log10(snr);
for i=1:length(Eb_N0_dB)
    
    y=[];
    y = addnoise(s,SNR(i)); % additive white gaussian noise
    z=[];
   % receiver - hard decision decoding
   z=demodulate(y);
  

   % counting the errors
   nErr(i) = size(find([x'-z]),2);
end

simBer = nErr/N; % simulated ber
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber

% plot
close all
figure
semilogy(Eb_N0_dB,theoryBer,'b.-');
hold on
semilogy(Eb_N0_dB,simBer,'mx-');
axis([-30 10 10^-5 0.5])
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
