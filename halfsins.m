function [even,odd]=halfsins(e,o)

Tb=0.01;
Ts=0.0001;
b=Tb/Ts;
te=-Tb:Ts:((length(e)-1-b)*Ts);
to=0:Ts:((length(0)-1)*Ts);
even=e.*cos(pi*te/2*Tb);
odd=o.*sin(pi*to/2*Tb);
end