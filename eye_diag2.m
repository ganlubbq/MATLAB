function s2=eye_diag2(x)
%function [s1,s2]=eye_diag(x)

Tb=0.01;
Ts=0.0001;
c=Tb/Ts;


%x=bitstr(10);
%y=zero2negone(x); <----- to ma byc na wejsciu
[a,b]=demux(x);
[z,x]=halfsins(a,b);


t=-Tb:Ts:((length(z)-1-c)*Ts);
fc=2/Tb;
%s1=z.*cos(2*pi*fc*t); %plot s1 cos and -cos
s2=x.*sin(2*pi*fc*t); %plot s2 sin and -sin SPROBOWAC SUBPLOT W FUNKCJI

%subplot(2,1,1), plot(t,s1,t,z,t,-z), grid on 
%subplot(2,1,2), plot(t,s2,t,x,t,-x), grid on
end