function y=d2a(x)
%c=Tb/Ts;
global c
y=zeros(1,length(x)*2*c);
plus=ones(1,2*c);
minus=-1*plus;
for i=1:length(x)
    if x(i)==1
        y((i-1)*2*c+1:i*2*c)=plus;
    else
       y((i-1)*2*c+1:i*2*c)=minus;
    end
end