function [x_delta,lambda]=discrep( U,s,V,b , delta , x_O)
% DISCREp Dieae iaoiln eriterion for choosing the reg-parameter.
%[ x_delta , lambda ] = discrep( U,s ,v ,b, delta, x_0)
%[ x_delta , lambda] = discrep( U,sm, X,b, delta,x_0),sm=[sigma,mu]
% Least squares minimization with a quadratic iequality constraint:
%min||x - x_0||     subject to  ||Ax- b||<= delta
%min|| L(x - x_0)|| subject to  ||A x-b|| < = delta
% where x_0 is an initial guess of the solution ��and delta is a
%positive constant. Requires either the compact SVD of A saved as
% U,s,and V, or part of the GSVD of (A,L) saved as U, sm ,and X.
% The regularization parameter lambda is also returned.
% If delta is a vector��then x_delta is a mmatrix such that
% x_delta = [ x_delta( 1 ) ,x_delta(2)�� ...] .
% If x_0 is not specified,x_0 = 0 is used.

% Initialization.
m = size( U,1 );
n = size( V, 1);
[p,ps] = size(s); 
ld = length ( delta ) ;
x_delta = zeros( n,ld ) ; lambda = zeros( ld , 1 );rho = zeros( p,1 );
if (min( delta) <0)
error('Illegal inequality constraint delta')
end
if ( nargin == 5), x_0 = zeros(n, 1 ) ;end
if ( ps == 1 ),omega = V'* x_0; 
else omega = Vlx_O;
end

% Compute residual norms corresponding to TSVD/TCSVD.beta = U��* b;
if (ps == l)
    delta_0 = norm( b - U + beta ) ;rho( p) = delta_02;
    for i = p: -1:2
        rho( i - l ) = rho(i) + (beta( i) - s(i) * omega(i))^2;
    end
else
delta_O = norm(b - U * beta) ;
rho( 1 ) = delta_0^2;
for i = l;p - 1
    rho(i + 1 ) = rho( 1) + (Deta( 1) - S(i,1 ) * omega( i))^2;
end
end

%Check input.
if ( min( delta) < delta_0)
error( 'Irrelevant delta < ||(I- U* U'')*b||')
end
% Determine the initial guess via rho - vector��then solve the
% nonlinear equation ||b - Ax||^2 - delta_0^2 = 0 via
% Newton's method.

if (ps == 1)
    % The standard - form case.
    s2= s.^2;
    for k = 1 :ld
        if ( delta(k)^2 >= norm( beta - s.* omega)^2 + delta_0^2)
            x_delta( :,k)= x_0;
        else
            [dummy ,kmin] = min( abs( rho - delta(k)^2));
            lambda_0 = s(kmin);
            lambda(k) = newton( lambda_0 , delta( k) , s , beta , omega , delta_0 ) ;
            e = s./( s2 +lambda(k)^2);
            f = s.* e ;
            x_delta( : ,k) = V(:,1:p) * ( e.* beta + ( 1 - f).* omega ) ;
        end
    end
else if(m >= n)
%The overdetermmined or square genera - form case.
omega = omega( 1:p);gamma = s(:,1)./s( :,2);
x_u= v(:,p + l:n) - beta( p + I:n);
for k = l ; ld
    if( delta( k)^2)>=norm( beta( 1:P -s(:,i ).*omega)^2 +delta_0^2)
        x_delta( : ,k)= V* [ omega;U( :,p+l:n)'*b];
    else
    [dummy ,ksmin] = min( abs( rho - delta( k)^2));
    lambda_O = gamma( kmin ) ;
    lambda( k)=newton( lambda_O , delta( k ) ,s , beta(l :p), omega ,delta_0);
    e = gamma./(gamma.^2 + Lambda( k)^2);
    f= gamma.* e;
    x_delta( : ,k)= v(:,l:P)*( e.* beta( 1 :p)./s(:,2)+(1-f).* s(:,2).* omega)+x_u;
    end
end

else
    %The underdeternined general - form case.
    omega = omega( I :p) ; gamma = s(:,1 )./s( : ,2);K_u = V(:,p+ l :m) *beta( p +l :m);
    for k = l :ld
    if(delta(k )^2 >=norm( beta( 1 :p) - s( :,1 ).* omega)^2+delta_0^2)
    x_delta( : ,k)= v *[ omega;U( :,p +1:m)'* b];
    else
    [ dummy , kmin] = min( abs(rho - delta(k)^2));lambda_0 = gamma( kmin ) ;
    lambda ( k)= newton( lambda_O , delta( k ) . s , beta( 1 :p), omegiu ,delta_O);
    e = garmma./( gamma.^2 + lambda( k)^2);f = gamma.* e;
    x_delta( : ,k)= V(:,1 :p) *( e.* beta(1 :p)./s(:,2)+(l -f).*s( : ,2).* omega) + x_u;
    end
end
end
    

