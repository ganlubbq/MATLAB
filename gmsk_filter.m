function [E,O]=gmsk_filter(x)

global Tb Ts c


Tb=0.07;
Ts=0.001;
c=Tb/Ts;
fc=2/Tb;
N=1000;




X=zero2negone(x);
[e,o]=demux(X);
%et=d2a(e,Ts,Tb);
%ot=d2a(o,Ts,Tb);
et=[];
ot=[];
for i=1:length(e)
    et=[et  e(i) zeros(1,2*c-1)];
    ot=[ot  o(i) zeros(1,2*c-1)];
end
et=[et,zeros(1,c)];
ot=[zeros(1,c),ot];
t=-Tb:Ts:((length(et)-1-c)*Ts);
ec=cos(2*pi*fc*t);%.*cos(pi*t/(2*Tb));
oc=sin(2*pi*fc*t);%.*sin(pi*t/(2*Tb));

sigma=sqrt(log(2))/2*pi*0.1;
n=-100:100;
hg=1/(sqrt(2*pi)*sigma*Tb)*exp(((-n.*Ts).^2)/2*sigma^2*Tb^2);
w=blackman(length(n));
hw=0.01*hg.*w';
%hw = FSPECIAL('gaussian',[1,100],sigma);



E=filter(hw,1,et);
O=filter(hw,1,ot);
%E=conv(hw,et);
%O=conv(hw,ot);
%E=E(101:end-100);
%O=O(101:end-100);


end