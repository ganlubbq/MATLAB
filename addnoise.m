function y=addnoise(X)

%m=length(x);
%y=x+randn(1,m);

N=1000;
X=[];
   for i = 1:N
      U = unifrnd(0,1,1,10);
      X = X + U;
   end
	
   % for unifrnd randoms in [0,1], mu = 0.5 and var = 1/12 */
   % adjust X so mu = 0 and var = 1 */
	
   X = X .- N/2;                % set mean to 0
   X = X .* sqrt(12 / N);       % adjust variance to 1