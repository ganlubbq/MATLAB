function s=mod_test(s1,s2)
% adds the even and odd parts to get the final msk modulted signal

Tb=0.01;
Ts=0.0001;
c=Tb/Ts;
 
 


s=s1+s2;

%figure(4)
%subplot(2,1,1), plot(t,s1,t,z,t,-z), grid on 
%subplot(2,1,2), plot(t,s2,t,x,t,-x), grid on

%figure(5)
%plot(t,s)