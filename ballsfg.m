function [num den res] = ballsfg(kind, n)
% Algebraic forms of radius and diameter recurrence relations for integer dimensions
% INPUT:
% kind - relation; can be 'f' or 'g'
% n    - dimension
% OUTPUT:
% num  - absolute f or g numerator
% den  - absolute f or g denominator
% res  - f or g
%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 21.05.2022
% v2: 22.05.2022
% v3: 25.05.2022 % sign factor as integral powers of the imaginary unit simplifications

if nargin ~= 2
    error 'Wrong number of arguments';
end

if mod(n,1)
    error 'n is not an iteger';
end

%floorn2     = floor(n/2);

num = 0;
den = 1;
res = 0;

switch kind
  case 'f'
    if ~mod(n,2)   % n is even
      if n>=0
        num = 1;
        den = factorial(n/2);        
      end
    else           % n is odd
      if n>=-1
        num = ( 2^(n+1) ) * factorial( (n+1)/2 );
        den = factorial(n+1);
        nn  = (n+1)/2; % simplify the fraction
        fct = factorial(nn)*2^nn;
        num = num/fct;
        den = den/fct;        
     else %n<=-1
        num = factorial(-n-1);
        den = factorial( (-n-1)/2 )*2^(-n-1);
        nn  = -(n+1)/2; % simplify the fraction
        fct = factorial(nn)*2^nn;
        num = num/fct;
        den = den/fct;        
      end
    end
  case 'g'
    if ~mod(n,2)   % n is even
      if n>=0
        num = 1;
%        den = (4^floorn2)*factorial(floorn2);
        den = factorial(n/2)*2^n;
      end 
    else           % n is odd
      if n>=1
%         num = 1;
%         den = factorial(2*floorn2+1)/factorial(floorn2);
         num = factorial( (n-1)/2 );
         den = factorial(n);
         % simplify the fraction
         den = den/num;        
         num = num/num;
      else %n<=1
%        num = 2*factorial( 2*floor(-n/2) );
%        den = factorial( floor(-n/2) );  
        num = 2*factorial( -n-1 );
        den = factorial( (-n-1)/2 );  
        % simplify the fraction
        num = num/den;
        den = den/den;        
      end
    end
  otherwise
    error 'Unknown kind of recurrence relation';
end

if n<0
%  signfct     = -( (-1)^floorn2 );
  signfct     = -i^(n-1);
  res = signfct*num/den;
else  
  res = num/den;
end  

return
