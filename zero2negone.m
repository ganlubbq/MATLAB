function y=zero2negone(x)
y=[];
Tb=0.01;
Ts=0.0001;
b=Tb/Ts;
for i=1:length(x)
    %if x(i)==0
        %for j=1:b
        %z(j)=-1;
        %end
        %y=[y,z];
    if x(i)==0
        %for j=1:b
        y(i)=-1;
    else 
        y(i)=1;
        end
       % y=[y,z];
end
end

