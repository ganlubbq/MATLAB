function y=d2a(x,Ts,Tb)
y=[];
plus=ones(1,Tb/Ts);
minus=-1*plus;
for i=1:length(x)
    if x(i)==1
        y=[y plus];
    else
        y=[y minus];
end
end