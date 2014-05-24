function y=integral(x)
y=0;
for i=1:length(x)-1
    y=y+((x(i)+x(i+1))/2);
    
end
end
    