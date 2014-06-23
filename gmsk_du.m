function y=gmsk_du(x)
global c
j=1;
for i=1:c:length(x)-c
    y(j)=integral(x(i:i+c))>0;
    j=j+1;
end