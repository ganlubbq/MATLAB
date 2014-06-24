
function [s1,s2]=msk_carriers(x)
% takes a bitstream and outputs the modulated I and Q components
global Tb Ts c


[a,b]=demux(x);
[z,x]=halfsins(a,b); 


t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
% multiplying halfsinusoids by carriers
s1=z.*cos(2*pi*fc*t); 
s2=x.*sin(2*pi*fc*t); 

%subplot(2,1,1), plot(t,s1,t,z,t,-z), grid on 
%subplot(2,1,2), plot(t,s2,t,x,t,-x), grid on
end