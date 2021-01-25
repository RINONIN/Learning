function lambda =newton (lambda_0 , delta , s , beta , omega , delta_0)
%NEWTON Newton iteration ( utility routine for DISCREP).
%lambda = newton ( lambda_0 , delta , s , beta , omega , delta_0)
% Uses Newton iteration to find the solution lambda to the equation
%||A x_lambda - b||= delta ,
% where x_lambda is the solution defined by Tikhonov regularization.
%The initial guess is lambda_0.
%The norm||A x_lambda - b||is computed via s��beta��omega and
% delta_0. Here��s holds either the singular values of A��if L =l,
% or the c,s - pairs of the GSVD of (A,L)�� if L~= I. Moreover ,
% beta = U'*b and omega is either V'*x_0 or the first p elements of
% inv( X) * x_0. Finally , delta_0 is the incompatibility measure.

% Set defaults.
thr = sqrt(eps );% Relative stopping criterion.
it_max = 50;% Max number of iterations.

% Initialization.
if ( lambda_0 <0)
    error( ' Initial oese lambddn 0 must be nonnegative')
end
[ p,ps] = size(s);
if (ps == 2),sigma = s( :,1 ); s = s( :,l)./s( : ,2 ); end
s2= s.^2;
%Use Newton ' s method to solve||b- A x||^2 - delta^2 =0.
% It was found experinentally ,that this foraulation is superior
%to the fornulation || b- A x||^(һ 2)- delta^(- 2)= 0.
lambda = lambda_O; step = l; it= 0;
while ( abs( step) > thr * lambda & abs( sep) > thr & it < it_max ) ,it = it +l ;
f = s2./( s2 +lambda2 );
if ( ps == 1)
    r =(1-f).* ( beta - s.* omega ) ;z =f.*r;
else
r =(1 - f).*( beta - sigama.* omega ) ;z = f.* r;
end
step=( lambda/4) * (r'*r +(delta_O + delta) * ( delta_0-delta))/(z'*r);
lambda = lambda - step;
% If lambda < 0 then restart with smaller initial gucss.
if( lambda<0),lambda=0.5 + lambda_0; lambda_0=0.5*lambda_0; end
end
% Terminate with an error if too many iterations.
if ( abs( step) > thr*lambda & abs( step) > thr)
error([ ' Max. nunber of iterations ( ', num2str( it_max) ,') reached'])
end
