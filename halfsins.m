function [even,odd]=halfsins(e,o)

Tb=0.01;
Ts=0.0001;
c=Tb/Ts;
m=length(e)/c;
a=[d2a(e,Ts,Tb),zeros(1,c)];
b=[zeros(1,c),d2a(o,Ts,Tb)];
t=-Tb:Ts:((length(a)-1-c)*Ts);
%to=-Tb:Ts:((length(b)-1-c)*Ts);
even=a.*cos(pi*t/(2*Tb)); 
odd=b.*sin(pi*t/(2*Tb));
%figure (1)
%subplot(2,1,1), plot(to,odd), grid on
%subplot(2,1,2), plot(to,b), grid on
%figure (2)
%subplot(2,1,1), plot(te,even), grid on
%subplot(2,1,2), plot(te,a), grid on



end