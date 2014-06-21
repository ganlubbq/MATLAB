function [s1,s2]=eye_diag(x)

global Tb Ts c

%Tb=0.01;
%Ts=0.0001;
%c=Tb/Ts;

%x=bitstr(10);
%y=zero2negone(x);
[a,b]=demux(x);

[z,x]=halfsins(a,b);


t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
s1=z.*cos(2*pi*fc*t);
s2=x.*sin(2*pi*fc*t);
end