function [V V2 VR VR2 S S2 SR SR2] = vsomni(n, kind, D)
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
% V     - volume
% V2    - volume 2nd negative branch, if present, orherwise V
% VR    - volume reflection relation, if present, orherwise V
% VR2   - volume 2nd negative branch reflection relation, if present, orherwise VR
% S     - surface
% S2    - surface 2nd negative branch, if present, orherwise S
% SR    - surface eflection relation, if present, orherwise S
% SR2   - surface 2nd branch eflection relation, if present, orherwise SR
%
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 16.08.2022
% v2: 02.10.2022
% v3: 20.12.2022

if nargin < 2
  error 'Wrong number of arguments in vsomni.';
end
if nargin == 2
  D = 1;
end

A = D;
  
switch kind
  case('SIM') % regular n-simplex
    V  =   ( 1+n).^(1/2) .* A.^( n)  ./ ( gamma2( n+1) .* ( 2.^( n/2) ) );                % volume
   %VR =   ( 1-n).^(1/2) .* A.^(-n)  ./ ( gamma2(-n+1) .* ( 2.^(-n/2) ) );                % volume reflection relation (step 1: n to -n)
   %VRm= i*( m-1).^(1/2) .* A.^(-m)  ./ ( gamma2(-m+1) .* ( 2.^(-m/2) ) );                % volume reflection relation (step 2: extract i)
   %VR = i*(-n-1).^(1/2) .* A.^( n)  ./ ( gamma2( n+1) .* ( 2.^( n/2) ) );                % volume reflection relation (step 3: -n to n)
    VR = V;                                                                               % volume reflection relation
    V2 = -V;                                                                              % volume 2nd negative branch (if present)
    VR2= -VR;                                                                             % volume 2nd negative branch reflection relation (if present)

    S  =    ( n).^(3/2) .* ( n+1) .* A.^( n-1) ./ ( gamma2( n+1) .* ( 2.^(( n-1)/2) ) );  % surface
   %SR =    (-n).^(3/2) .* (-n+1) .* A.^(-n-1) ./ ( gamma2(-n+1) .* ( 2.^((-n-1)/2) ) );  % surface reflection relation (step 1)
   %SRm= -i*( m).^(3/2) .* (-m+1) .* A.^(-m-1) ./ ( gamma2(-m+1) .* ( 2.^((-m-1)/2) ) );  % surface reflection relation (step 2)
   %SR = -i*(-n).^(3/2) .* ( n+1) .* A.^( n-1) ./ ( gamma2( n+1) .* ( 2.^(( n-1)/2) ) );  % surface reflection relation (step 3)
    SR = S;                                                                               % surface reflection relation
    S2 = -S;                                                                              % surface 2nd negative branch (if present)
    SR2= -SR;                                                                             % surface 2nd negative branch reflection relation (if present)
  case('SIB') % regular n-simplex inscribed in n-ball
    V  =    ( n+1).^((1+n)/2) .* ( n).^(-n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
   %VR =    ( 1-n).^((1-n)/2) .* (-n).^( n/2) .* 2.^( n) .* D.^(-n) ./ gamma2(1-n);
   %VRm= -i*( m-1).^((1-m)/2) .* ( m).^( m/2) .* 2.^( m) .* D.^(-m) ./ gamma2(1-m);
    VR = -i*(-n-1).^((1+n)/2) .* (-n).^(-n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    V2 = -V;                                                                                      
    VR2= -VR;                                                                                     
  
    S  =   ( n).^((4-n)/2) .* ( n+1).^((n+1)/2) .* 2.^(-n+1) .* D.^( n-1) ./ gamma2(1+n);
   %SR =   (-n).^((4+n)/2) .* ( 1-n).^((1-n)/2) .* 2.^( n+1) .* D.^(-n-1) ./ gamma2(1-n);
   %SRm= i*( m).^((4+m)/2) .* ( m-1).^((1-m)/2) .* 2.^( m+1) .* D.^(-m-1) ./ gamma2(1-m);
    SR = i*(-n).^((4-n)/2) .* (-n-1).^((n+1)/2) .* 2.^(-n+1) .* D.^( n-1) ./ gamma2(1+n);
    S2 = -S;                                                                                   
    SR2= -SR;                                                                                  
  case('SCB') % regular n-simplex circumscribed about n-ball
    V  =                ( 1+n).^((1+n)/2) .* ( n).^( n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
   %VR  =               ( 1-n).^((1-n)/2) .* (-n).^(-n/2) .* 2.^( n) .* D.^(-n) ./ gamma2(1-n);
   %VRm = i.^(1-2*m) .* ( m-1).^((1-m)/2) .* ( m).^(-m/2) .* 2.^( m) .* D.^(-m) ./ gamma2(1-m);
    VR  = i.^(1+2*n) .* (-n-1).^((1+n)/2) .* (-n).^( n/2) .* 2.^(-n) .* D.^( n) ./ gamma2(1+n);
    V2 = -V;                                                                                   
    VR2= -VR;                                                                                  

    S  =               ( n).^((2+n)/2) .* ( 1+n).^((1+n)/2) .* D.^( n-1) .* 2.^(1-n) ./ gamma2(1+n);
   %SR =               (-n).^((2-n)/2) .* ( 1-n).^((1-n)/2) .* D.^(-n-1) .* 2.^(1+n) ./ gamma2(1-n);
   %SRm= i.^(3-2*m) .* ( m).^((2-m)/2) .* ( m-1).^((1-m)/2) .* D.^(-m-1) .* 2.^(1+m) ./ gamma2(1-m);
    SR = i.^(3+2*n) .* (-n).^((2+n)/2) .* (-n-1).^((1+n)/2) .* D.^( n-1) .* 2.^(1-n) ./ gamma2(1+n);
    S2 = -S;                                                                                   
    SR2= -SR;                                                                                  
  case('ORT') % n-orthoplex
    V  = 2.^( n/2) .* A.^( n) ./ gamma2( n+1);
   %VR = 2.^(-n/2) .* A.^(-n) ./ gamma2(-n+1);
   %VRm= 2.^( m/2) .* A.^( m) ./ gamma2( m+1);
    VR = V;
    V2 = V;
    VR2= VR;

    S  =    ( n).^(3/2) .* 2.^(( n+1)/2) .* A.^( n-1) ./ gamma2( n+1);
   %SR =    (-n).^(3/2) .* 2.^((-n+1)/2) .* A.^(-n-1) ./ gamma2(-n+1);
   %SRm= -i*( m).^(3/2) .* 2.^((-m+1)/2) .* A.^(-m-1) ./ gamma2(-m+1);
    SR = -i*(-n).^(3/2) .* 2.^(( n+1)/2) .* A.^( n-1) ./ gamma2( n+1);
    S2 = -S;
    SR2= -SR;
  case('OIB') % n-orthoplex inscribed in n-ball
    V  = D.^( n) ./ gamma2( n+1);
   %VRm= D.^(-m) ./ gamma2(-m+1);
    VR = V;
    V2 = V;
    VR2= VR;
  
    S  =   2*( n).^(3/2) .* D.^( n-1) ./ gamma2( n+1);
   %SR =   2*(-n).^(3/2) .* D.^(-n-1) ./ gamma2(-n+1);
   %SRm= i*2*( m).^(3/2) .* D.^(-m-1) ./ gamma2(-m+1);
    SR = i*2*(-n).^(3/2) .* D.^( n-1) ./ gamma2( n+1);
    S2 = -S;
    SR2= -SR;
  case('OCB') % n-orthoplex circumscribed about n-ball
    V  =            ( n).^( n/2) .* D.^( n) ./ gamma2( n+1);
   %VR =            (-n).^(-n/2) .* D.^(-n) ./ gamma2(-n+1);
   %VRm= i.^(-m) .* ( m).^(-m/2) .* D.^(-m) ./ gamma2(-m+1);
    VR = i.^( n) .* (-n).^( n/2) .* D.^( n) ./ gamma2( n+1);
    V2 = V;
    VR2= VR;

    S  =             2 .*         ( n).^((2+n)/2) .* D.^( n-1) ./ gamma2( n+1);
   %SR =             2 .*         (-n).^((2-n)/2) .* D.^(-n-1) ./ gamma2(-n+1);
   %SRm=  i.^(-m) .* 2 .* (-m) .* ( m).^(( -m)/2) .* D.^(-m-1) ./ gamma2(-m+1);
    SR = -i.^( n) .* 2 .* ( n) .* (-n).^((  n)/2) .* D.^( n-1) ./ gamma2( n+1);
    S2 = -S;
    SR2= -SR;
  case('CIB') % n-cube inscribed in n-ball
    V  =            ( n).^(-n/2) .* D.^( n);
   %VR =            (-n).^( n/2) .* D.^(-n);
   %VRm= i.^( m) .* ( m).^( m/2) .* D.^(-m);
    VR = i.^(-n) .* (-n).^(-n/2) .* D.^( n);
    V2 = V;
    VR2= VR;

    S  =  2 .*             ( n).^((3-n)/2) .* D.^( n-1);
   %SR =  2 .*             (-n).^((3+n)/2) .* D.^(-n-1);
   %SRm= -2 .* i.^(1+m) .* ( m).^((3+m)/2) .* D.^(-m-1);
    SR = -2 .* i.^(1-n) .* (-n).^((3-n)/2) .* D.^( n-1);
    S2 = S;
    SR2= SR;
  case('BAL')
    V  = ( 2.^(-n) ) .* ( pi.^( n/2) ) .* D.^( n) ./ gamma2(( n/2)+1);
   %VRm= ( 2.^( m) ) .* ( pi.^(-m/2) ) .* D.^(-m) ./ gamma2((-m/2)+1);
    VR = V;
    V2 = V;
    VR2= VR;

    S  = ( 2.^(1-n) ) .* ( n) .* ( pi.^( n/2) ) .* D.^( n-1) ./ gamma2(( n/2)+1);
   %SR = ( 2.^(1+n) ) .* (-n) .* ( pi.^(-n/2) ) .* D.^(-n-1) ./ gamma2((-n/2)+1);
    SR = S;
    S2 = S;
    SR2= SR;
  case('CUB') % n-cube 
  case('CCB') % n-cube circumscribing n-ball  
    V  = A.^n;
    VR = V;
    V2 = V;
    VR2= VR;

    S  = 2*( n).*A.^( n-1);
    SR = S;
    S2 = S;
    SR2= SR;
  otherwise
    error 'Wrong kind of formula; can be ''SIB'', ''SCB'', ''OIB'', ''OCB'', ''CIB'', ''CCB'', ''SIM'', ''ORT'', ''CUB'', ''BAL''';
end

return
