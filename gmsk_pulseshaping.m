function xt=gmsk_pulseshaping(x)
global Tb Ts c

% creates a vector with c samples per bit 
 xt=zeros(1,length(x)*c);
 plus=ones(1,c);
 minus=-1*plus;
 for i=1:length(x)
    if x(i)==1
        xt((i-1)*c+1:i*c)=plus;
    else
       xt((i-1)*c+1:i*c)=minus;
       % xt=[xt x(i) zeros(1,c-1)];
    end
end


