function xt=qpsk_pulseshaping(x)
% get a vector with Tb/Ts samples per symbol of the input vector

global Tb Ts c
xt=zeros(1,length(x)*c);
plus=ones(1,c);
minus=-1*plus;
for i=1:length(x)
    if x(i)==1
        xt((i-1)*c+1:i*c)=plus;
    else
       xt((i-1)*c+1:i*c)=minus;
    end