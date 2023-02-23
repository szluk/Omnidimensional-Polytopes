function [V VR S SR] = vsomni(n, kind, D)
% Volume and surface of n-simplices, n-orthoplices, n-cubes, and n-balls including inscribed in and circumscribed about the latter
% INPUT:
% n     - vector of dimensions to which V and S is returned
% kind  - kind of formula; can be 'SIB', 'SCB', 'OIB', 'OCB', 'CIB', 'CCB', 'SIM', 'ORT', 'CUB', 'BAL'
% 'BAL' - n-ball
% 'SIM' - regular n-simplex
% 'ORT' - n-orthoplex
% 'CUB' - n-cube
% 'SIB' - regular n-simplex inscribed in n-ball
% 'SCB' - regular n-simplex circumscribed about n-ball
% 'OIB' - n-orthoplex inscribed in n-ball
% 'OCB' - n-orthoplex circumscribed about n-ball
% 'CIB' - n-cube inscribed in n-ball
% 'CCB' - n-cube circumscribed about n-ball
% D     - n-ball diameter (or politope edge length A), default D = 1
% OUTPUT:
% V     - volume principal branch
% VR    - volume reflection relation, if present, orherwise V
% S     - surface principal branch
% SR    - surface eflection relation, if present, orherwise S
%
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 16.08.2022
% v2: 02.10.2022
% v3: 20.12.2022
% v3: 04.02.2023 (all volumes and surfaces are bivalued)
% v3: 22.02.2023 (clean up)

if nargin < 2
  error 'Wrong number of arguments in vsomni.';
end
if nargin == 2
  D = 1;
end

A = D;
  
switch kind
  case{'BAL'}
    V  = ( 2.^(-n) ) .* ( pi.^( n/2) ) .* D.^( n) ./ gamma2(( n/2)+1);
    VR = V;
    S  = ( 2.^(1-n) ) .* ( n) .* ( pi.^( n/2) ) .* D.^( n-1) ./ gamma2(( n/2)+1);
    SR = S;
  case{'SIM'} % regular n-simplex
    V  =   ( 1+n).^(1/2) .* A.^( n)  ./ ( gamma2( 1+n) .* ( 2.^( n/2) ) );
    VR = V;
    S  =   ( n).^(3/2) .* ( n+1) .* A.^( n-1) ./ ( gamma2( n+1) .* ( 2.^(( n-1)/2) ) );
    SR = S;
  case{'ORT'} % n-orthoplex
    V  = 2.^( n/2) .* A.^( n) ./ gamma2( n+1);
    VR = V;
    S  =   ( n).^(3/2) .* 2.^(( 1+n)/2) .* A.^( n-1) ./ gamma2( n+1);
    SR = S;
  case{'SIB'} % regular n-simplex inscribed in n-ball
    V  =   ( 1+n).^((1+n)/2) .* ( n).^(-n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    %VR = i*(-1-n).^((1+n)/2) .* (-n).^(-n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    VR = V;    
    S  =     ( n).^((4-n)/2) .* ( 1+n).^(( 1+n)/2) .* 2.^( 1-n) .* D.^(-1+n) ./ gamma2(1+n);
    %SR = i^5*(-n).^((4-n)/2) .* (-1-n).^(( 1+n)/2) .* 2.^( 1-n) .* D.^(-1+n) ./ gamma2(1+n);
    SR = S;    
  case{'SCB'} % regular n-simplex circumscribed about n-ball
    V  =               ( 1+n).^((1+n)/2) .* ( n).^( n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    VR = i.^(1+2*n) .* (-1-n).^((1+n)/2) .* (-n).^( n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    S  =               ( n).^((2+n)/2) .* ( 1+n).^((1+n)/2) .* D.^(-1+n) .* 2.^(1-n) ./ gamma2(1+n);
    SR = i.^(3+2*n) .* (-n).^((2+n)/2) .* (-1-n).^((1+n)/2) .* D.^(-1+n) .* 2.^(1-n) ./ gamma2(1+n);
  case{'OIB'} % n-orthoplex inscribed in n-ball
    V  = D.^( n) ./ gamma2( n+1);
    VR = V;
    S  =   2*( n).^(3/2) .* D.^( n-1) ./ gamma2( n+1);
    SR = S;
  case{'OCB'} % n-orthoplex circumscribed about n-ball
    V  =            ( n).^( n/2) .* D.^( n) ./ gamma2( n+1);
    VR = i.^( n) .* (-n).^( n/2) .* D.^( n) ./ gamma2( n+1);
    S  =             ( n).^((2+n)/2) .* 2 .* D.^( n-1) ./ gamma2( n+1);
    SR = i.^(2+n) .* (-n).^((2+n)/2) .* 2 .* D.^( n-1) ./ gamma2( n+1);
  case{'CIB'} % n-cube inscribed in n-ball
    V  =            ( n).^(-n/2) .* D.^( n);
    VR = i.^(-n) .* (-n).^(-n/2) .* D.^( n);
    S  =  2 .*             ( n).^((3-n)/2) .* D.^( n-1);
    SR =  2 .* i.^(3-n) .* (-n).^((3-n)/2) .* D.^( n-1);
  case{'CUB', 'CCB'} % n-cube or n-cube circumscribing n-ball  
    V  = D.^n;
    VR = V;
    S  = 2*( n).*D.^( n-1);
    SR = S;
  otherwise
    error 'Wrong kind of formula; can be ''SIB'', ''SCB'', ''OIB'', ''OCB'', ''CIB'', ''CCB'', ''SIM'', ''ORT'', ''CUB'', ''BAL''';
end

return
