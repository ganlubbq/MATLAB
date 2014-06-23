function x=qpsk_du(I,Q)
% final step of qpsk demodulation

j=1;
% integrate over a period of Tb and compare to 0
for i=1:c:length(I)-c
    z(j)=integral(I(i:i+c-1))>0;
    j=j+2;
end
j=2;
for i=1:c:length(Q)
    z(j)=integral(Q(i:i+c-1))>0;
    j=j+2;
end