
Tb=0.01;
Ts=0.0001;
c=Tb/Ts;


stream=bitstr(10)
y=zero2negone(stream);
[a,b]=demux(y);

[z,x]=halfsins(a,b);


t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
s1=z.*cos(2*pi*fc*t);
s2=x.*sin(2*pi*fc*t);
s=s1+s2;

figure(4)
subplot(2,1,1), plot(t,s1,t,z,t,-z), grid on 
subplot(2,1,2), plot(t,s2,t,x,t,-x), grid on
%u=s.*cos(2*pi*fc*t).*cos(pi*t/(2*Tb));





%figure(5)
%plot(t,u)
