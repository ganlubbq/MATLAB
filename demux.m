function  [even,odd]=demux(x)

even=[];
odd=[];
Tb=0.01;
Ts=0.0001;
b=Tb/Ts;
%{
for i=1:2:(length(x)/b)
    for j=1:b
        even=[even,x(j+10*(i-1)),x(j+10*(i-1))];
    end
end
for i=2:2:(length(x)/b)
    for j=1:b
        odd=[odd,x(j+10*(i-1)),x(j+10*(i-1))];
    end
end
even=[even,zeros(1,b)];
odd=[zeros(1,b),odd];
end
%}
for i=1:2:length(x)
    even=[even,x(i)];
end
for i=2:2:length(x)
    odd=[odd,x(i)];
end
        
    