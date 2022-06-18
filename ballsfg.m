function [num den frac] = ballsfg(n, kind)
% Algebraic forms of radius and diameter recurrence relations for integer dimensions
% INPUT:
% kind - relation; can be 'f' (default) or 'g'
% n    - dimension
% OUTPUT:
% num            - f or g numerator
% den            - f or g denominator
% frac = num/den - f or g
%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 21.05.2022
% v2: 22.05.2022
% v3: 25.05.2022 % sign factor as integral powers of the imaginary unit
% v4: 16.06.2022 % simplified for f_n = g_n*2^n

if nargin <= 0
    error 'Wrong number of arguments';
end
kind = 'f';
if nargin == 2
  kind = 'g';
end

if mod(n,1)
    error 'n is not an iteger';
end

num = 0;
den = 1;
frac = 0;

% calculate num and den for f 
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

if n<0
  signfct = i^(n+1);
  num     = signfct*num;
end

frac = num/den;

% calculate num and den for g 
if kind == 'g'
  frac = frac*2^(-n);
  [num,den] = rat(frac);
end

return
