function Xnext = recrel(Xprev, n, A, kind)
% Recurrence relations for n-simplices, n-orthoplices, n-balls, etc.
% INPUT:
% Xprev - previous value
% n     - dimension
% A     - edge length or radius
% kind  - kind of relation can be
% 'Vsimplex_up',  'Vsimplex_down',
% 'Vorthoplex_up','Vorthoplex_down'
% 'Vball_up','Vball_down'
% OUTPUT:
% Xnext - next value
%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 16.08.2022

if nargin ~= 4
    error 'Wrong number of arguments';
end

switch kind
  case 'Vsimplex_up'
    Xnext = Xprev*A*sqrt( (n+1)/(2*n^3) );
  case 'Vsimplex_down'
    Xnext = Xprev*sqrt( 2*( (n+1)^3 ) / (n+2) )/A;
  case 'Vorthoplex_up'
    Xnext = Xprev*A*sqrt(2)/n;
  case 'Vorthoplex_down'    
    Xnext = Xprev*(n+1)/sqrt(2)/A;
  case 'Vball_up'    
    Xnext = Xprev*2*pi*(A^2)/n;
  case 'Vball_down'
    Xnext = Xprev*(n+2)/(2*pi*(A^2));  
  otherwise
    error 'Wrong kind of relation';
end
