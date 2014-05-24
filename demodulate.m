function y=demodulate(x)

Tb=0.01;
Ts=0.0001;
c=Tb/Ts;
fc=2/Tb;

t=-Tb:Ts:((length(x)-1-c)*Ts);
y=[];
even=x.*cos(2*pi*fc*t).*cos(pi*t/(2*Tb));
odd=x.*sin(2*pi*fc*t).*sin(pi*t/(2*Tb));
j=1;
for i=1:2*c:length(even)-2*c
    z(j)=integral(even(i:i+2*c));
    j=j+2;
end
j=2;
for i=c:2*c:length(even)-c
    z(j)=integral(odd(i+c:i+2*c));
    j=j+2;
end
for i=1:length(z)
    if z(i)>0
        y(i)=1;
    else
        y(i)=-1;
    end
end
    
    
    

