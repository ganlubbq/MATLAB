function  [even,odd]=demux(x)


%{
for i=1:2:length(x)
    even=[even,x(i)];
end
for i=2:2:length(x)
    odd=[odd,x(i)];
%}
even=x(1:2:end);
odd=x(2:2:end);
end
        
    