
function [ reg_corner,rho,eta,reg_param] =l_curve( U,sm,b,method ,L,V)
%L_CURVE Plot the L-curve and find its " corner" .
%[reg corner ,rho , eta , reg_param] =
%       l_curve( U,s,b , method)
%       l_curve(U , sm , b , method ) , sm = [ sigma , mu ]
%       l_curve( U ,s , b , method ,L,V)
%Plots the l-shaped curve of eta , the soluation norm ||x|| or
%semi - norm||Lx|| ,as a funet1on of rho��the residual norm
%||Ax -b|| , for the following methods :
%   method = 'Tikh':Tokhonov regularization(solid line)
%   method = 'tsvd':truncated SVD or GSVD ( o markers)
%   method = 'dsvd': damped SVD or GSVD( dotted line)
%   method = 'mtsvd ': modified TSVD( x markers)
%The corresponding reg. parameters are returned in reg_param. If 
%no method is specified then 'Tikh�� is default. For other methods
% use plot_le.
% Note that 'Tikh ', ' tsvd ��and ' dsvd��require either U and s
% ( standard-form regularization ) or U and sm ( general-form regularization) , while 'mtvsd�� requires U and s as well as
%Land V.
% lf any output arguments are specified �� then the corner of the
% L-curve is identified and the corresponding reg.parametere 
% reg_corner is returned. Use routine l_corner if an upper bound
% on eta is required.

if ( nargin == 3 ) ,method ='Tikh' ;end % Tikhonov reg. is default.
npoints = 200;% Number of points on the L - curve for Tikh and dsvd.
smin_ratio = 16 * eps;% Smallest regularization parameter.

% Initialization.
[m,n] = size(U); [p,ps] = size( sm ) ;
if (nargout > 0),locate = l ; else locate = 0;end
beta = U'*b; beta2 = norm( b)^2 - norm( beta)^2;
if (ps == l)
    s=sm; beta = beta( l:p);
else
    s = sm(p: - 1:l ,1 ) ./ sm(p: - l :1 ,2 ) ; beta = beta( p:-l:1);
end
xi = beta( l :p)./ s;

if ( strncmp( mcthod ,'Tikh' ,4)|strncmp( method , 'tikh',4 ))
    eta = zeros( npoints , 1 ) ; rho = eta; reg_param = ela ; s2 = s.^2;
    reg_param( npoints ) = max([s(p),s(1) * smin_ratio] );
    ratio = (s(1)/reg_param( npoints ))^(1/( npoints - 1));
    for i = npoints - l:- 1:l ,reg_param( i) = ratio * reg_param(i+l ) ;
    end
    for i = l : npoints
        f = s2./(s2 +reg_param(i)^2);eta( i) = norm( f.* xi);
        rho( i) = norm(( 1 -f).*beta( 1:p));
    end
    if (m > n & beta2 > 0) , rho = sqrt( rho.^2 + beta2 ) ; end
    marker = '-'; txt = 'Tikh.' ;
    
else if ( strncmp( method , 'tsvd' ,4)| strncmp( method , 'tgsv ' ,4))
    eta = zeros( p,1 ) ; rho = eta ;
    eta(1) = abs( xi(1))^2;
    for k = 2:p,eta(k ) = eta(k - 1) + abs( xi(k)) ^2 ;end
    eta = sqrt( eta);
    if (m > n)
        if ( beta2 > 0),rho( p) = beta2 ;else rho( p) = eps^2 ; end
    else
        rho(p) = eps^2;
    end
    for k = p -l:-l :1,rho(k ) = rho(k + l ) + abs( beta( k + 1) )^2 ;end
    rho = sqrt( rho);
    reg_param = ( 1 :p)';marker = 'o';
    if (ps == l)
        U = U(:,l :p); txt = 'TSVD';
    else
        U = U(:,1:p); txt = 'TGSVD';
    end
else if ( strncmp( method , 'dsvd' ,4)|strncmp(method , 'dsvd',4))
    eta = zeros( npoints , 1 ) ;rho = eta ; reg_param = eta;
    reg_param( npoints) = max([s( p),s(1) * smin_ratio] );
    ratio =(s( l)/reg_param ( npoints))^(1/( npoints -1 ));
    for i = npoints - l:-1:1 ,reg_param(i)=ratio*reg_param(i+1) ;
    end
    for i = l : npoints
        f = s./( s +reg_param(i) );eta( i) = norm(f.* xi );
        rho(i) = norm( (1 - f).* beta( l :p));
    end
    if (m > n & beta2 > 0),rho = sqrt( rho.^2 + beta2 ) ; end
    marker = ':';
    if ( ps ==1 ) , txt = ' DSVD'; 
    else txt = 'DGSVD '; 
    end
else if ( strncamp( method , ' mtsv' ,4))
    if ( nargin~= 6)
        error( 'The matrices L and V must also be specified')
    end
    [p,n] = size( L) ; rho = zeros(p,1 ) ; eta = rho;
    [Q,R] = qr(L* V( :,n: -1 :n - p),0);
    for i = l :p
        k = n- p +i;
        Lxk = L* V( :,1 :k) + xi( l : k);
        zk= R(1:n - k ,1 :n - k)(Q(:,1:n-k)'*Lxk);
        zk =zk(n- k: -1:1 ) ;
        eta(i) = norm( Q( : ,n - k + l:p)'* Lxk);
        if ( i< p)
            rho( i) = norm( beta( k + l:n) +s(k +l:n).*zk);
        else
            rho(i)= eps;
        end
    end
    if(m >n & beta2>0),rho=sqrt(rho.^2 + beta2 ) ; end
    reg_param =(n-P+1:n)' ; txt = 'MTSVD';
    U=U(:,reg_param) ; sm= sm( reg_param ) ;
    marker = 'x '; ps =2; %General form regularization
else
    error( 'Illegal method ')
end
end
end
end

%Locate the " corner" of the L - curve, if required.
if ( locate )[ reg_corner,rho_c,eta_c] = l_corner( rho , eta , regparam,U, sm , b , method ) ;
end
%Make plot.
plot_lc( rho , eta , marker,ps , reg_param) ;
if locate
    ax = axis;
    HoldState = ishold; hold on;
    loglog( [ min( rho)/100 , rho_c] ,[ eta_e ,eta_e],':r',[ rho_e,rho_c], [ min(eta)/100 ,eta_e], ' :r')
    title([ 'L-curve, ' ,txt,' corner at ' ,num2str( reg_corner)]);
    axis( ax)
    if (~ HoldState) , hold off;end
end
