function y=gmsk_integrate(x)
global Ts
y=zeros(1,length(x));
for i=1:length(x-1)
    y(i+1)=(y(i)+x(i))*Ts;
end
end