function s=mod_test(y)


Tb=0.01;
Ts=0.0001;
c=Tb/Ts;
 
 
%x=bitstr(10);
%y=zero2negone(x);
[a,b]=demux(y);

[z,x]=halfsins(a,b);


t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
s1=z.*cos(2*pi*fc*t);
s2=x.*sin(2*pi*fc*t);
s=s1+s2;

%figure(4)
%subplot(2,1,1), plot(t,s1,t,z,t,-z), grid on 
%subplot(2,1,2), plot(t,s2,t,x,t,-x), grid on

%figure(5)
%plot(t,s)