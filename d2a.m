function y=d2a(x,Ts,Tb)
y=[];
for i=1:length(x)
    for j=1:2*Tb/Ts;
        y=[y,x(i)];
    end
end
end