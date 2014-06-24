 function [even,odd]=halfsins(e,o)
 % Create the halfsinusoids for the even and odd bitstreams
 
 global Tb Ts c


a=[d2a(e),zeros(1,c)]; % adding zeros to match length
b=[zeros(1,c),d2a(o)]; % odd stream is delayed by Tb
t=-Tb:Ts:((length(a)-1-c)*Ts);


even=a.*cos(pi*t/(2*Tb)); 
odd=b.*sin(pi*t/(2*Tb));
%figure (1)
%subplot(2,1,1), plot(to,odd), grid on
%subplot(2,1,2), plot(to,b), grid on
%figure (2)
%subplot(2,1,1), plot(te,even), grid on
%subplot(2,1,2), plot(te,a), grid on



end