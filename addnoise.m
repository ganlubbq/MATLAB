function y=addnoise(x)

m=length(x);

y=x+0.1*randn(1,m);