function y=addnoise(x)
N=1000;
X=zeros(1,length(x));
   for i = 1:N
      U = unifrnd(-1,1,1,length(x));
      X = X + U;
   end
	
   % for unifrnd randoms in [0,1], mu = 0.5 and var = 1/12 */
   % adjust X so mu = 0 and var = 1 */
	
   X = X - 0/2;                % set mean to 0
   X = X * sqrt(12 / N);       % adjust variance to 1
   y=x+X;


%m=length(x);
%y=x+randn(1,m);

