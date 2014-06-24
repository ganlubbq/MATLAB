
clear all; close all; clc;

global Tb Ts c


Tb=0.07;
Ts=0.0001;
c=Tb/Ts;
fc=2/Tb;
N=10;



x=bitstr(N);
X=zero2negone(x);
%[e,o]=demux(X);
%et=d2a(e,Ts,Tb);
%ot=d2a(o,Ts,Tb);
xt=[];
X=X';

for i=1:length(X)
    
    xt=[xt X(i) zeros(1,c-1)];
    
end
xt=kron(X,ones(1,c));
%et=[et,zeros(1,c)];
%ot=[zeros(1,c),ot];
t=0:Ts:(length(xt))*Ts;
ec=cos(2*pi*fc*t);%.*cos(pi*t/(2*Tb));
oc=sin(2*pi*fc*t);%.*sin(pi*t/(2*Tb));

sigma=sqrt(log(2))/2*pi*0.5;
n=-100:100;
hg=1/(sqrt(2*pi)*sigma*Tb)*exp(((-n.*Ts).^2)/2*sigma^2*Tb^2);
w=blackman(length(n));
hw=0.75*hg.*w';
%hw = FSPECIAL('gaussian',[1,100],sigma);

%integration
int_xf=zeros(1,length(xt));
for i=1:length(xt-1)
    int_xf(i+1)=(int_xf(i)+xt(i))*Ts;
end

xf=filtfilt(hw,1,int_xf);
%O=filter(hw,1,ot);
%E=conv(hw,et);
%O=conv(hw,ot);
%E=E(101:end-100);
%O=O(101:end-100);




I=cos(pi*xf/(2*Tb));
Q=sin(pi*xf/(2*Tb));
Ic=I.*ec;
Qc=Q.*oc;
s=Ic-Qc;

%S=addnoise(s,-3);




[b,a]=butter(2,0.5*pi*fc*Ts);
s1=s.*ec;
s2=s.*oc;
Irx=filtfilt(b,a,s1);
Qrx=filtfilt(b,a,s2);

k=atan(Irx./-Qrx);
y=diff(k);
figure(1)
subplot(2,1,1); plot(atan(I./Q))
subplot(2,1,2); plot(k)

figure(2)
subplot(2,1,1); plot(int_xf)
subplot(2,1,2); plot(xf)
out=gmsk_du(k)


nErr=[];
y=[];
Eb_N0_dB =[-30:10];
R=1/Tb;
Eb_N0=10.^(Eb_N0_dB);
snr=Eb_N0;
SNR=10*log10(snr);
for i=1:length(Eb_N0_dB)
    
    y=[];
    y = addnoise(s,SNR(i)); % additive white gaussian noise
    z=[];
   % receiver - hard decision decoding
   z=gmsk_demodulate(y);
  

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
figure(2)
subplot(2,1,1); plot(E)
subplot(2,1,2); plot([d2a(e) zeros(1,2*c)])


