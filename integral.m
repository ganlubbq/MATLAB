function y=integral(x)
%y=0;

%z=[x(1) x(2:length(x))+x(1:length(x)-1) x(length(x))];
a=x(2:end);
b=x(1:end-1);
y=(sum(a)+sum(b))/2;
%for i=1:length(z)
 %   y=y+z(i);
    
%end
%y=y/2;
end
    