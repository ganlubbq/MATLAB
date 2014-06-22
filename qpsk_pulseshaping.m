function xt=qpsk_pulseshaping(x)

global Tb Ts c
xt=zeros(1,length(x)*c);
plus=ones(1,c);
minus=-1*plus;
for i=1:length(x)
    if x(i)==1
        xt((i-1)*2*c+1:i*2*c)=plus;
    else
       xt((i-1)*2*c+1:i*2*c)=minus;
    end