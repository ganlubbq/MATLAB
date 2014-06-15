
clear all; close all; clc;


Tb=0.01;
Ts=0.0001;
c=Tb/Ts;

N=1000;

x=bitstr(N);
X=zero2negone(x);

s=mod_test(X);
nErr=[];
y=[];
Eb_N0_dB = [-20:20];
for i=1:length(Eb_N0_dB)
    y=[];
    y = addnoise(s,Eb_N0_dB(i)); % additive white gaussian noise
    z=[];
   % receiver - hard decision decoding
   z=demodulate(y);
  

   % counting the errors
   nErr(i) = size(find(X-z),2);
end

simBer = nErr/N; % simulated ber
theoryBer = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber

% plot
close all
figure
semilogy(Eb_N0_dB,theoryBer,'b.-');
hold on
semilogy(Eb_N0_dB,simBer,'mx-');
axis([-20 20 10^-5 0.5])
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
