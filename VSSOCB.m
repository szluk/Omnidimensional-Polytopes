function [V V2 S S2] = VSSOCB(ns, kind, D)
% Volume and surface of n-simplices, n-orthoplices, n-cubes, and n-balls including inscribed in and circumscribed about the latter
% INPUT:
% ns    - vector of dimensions to which V and S is returned
% kind  - kind of formula; can be 'SIB', 'SCB', 'OIB', 'OCB', 'CIB', 'CCB', 'SIM', 'ORT', 'CUB', 'BAL'
% 'SIB' - regular n-simplex inscribed in n-ball
% 'SCB' - regular n-simplex circumscribed about n-ball
% 'OIB' - n-orthoplex inscribed in n-ball
% 'OCB' - n-orthoplex circumscribed about n-ball
% 'CIB' - n-cube inscribed in n-ball
% 'CCB' - n-cube circumscribed about n-ball
% 'SIM' - regular n-simplex
% 'ORT' - n-orthoplex
% 'CUB' - n-cube
% 'BAL' - n-ball
% D     - n-ball diameter (or edge length), default D = 1
% OUTPUT:
% VS    - volume or surface
%% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 16.08.2022
% v2: 02.10.2022

if nargin < 3
    error 'Wrong number of arguments in VSSOCB.';
end

switch kind
  case('SIB')
    A = D .* sqrt(ns+1) ./ sqrt(2) ./ sqrt(ns); % ASIB
  case('SCB')
    A = D .* sqrt(ns) .* sqrt(ns+1) ./ sqrt(2); % ASCB
  case('OIB')
    A = D ./ sqrt(2);                           % AOIB
  case('OCB')
    A = D .* sqrt(ns) ./ sqrt(2);               % AOCB
  case('CIB')
    A = D ./ sqrt(ns);                          % ACIB
  otherwise
    A = D;                                      % ACCB and otherwise, default assignment
end
  
switch kind(1)
  case('S') % regular n-simplex
    V  = sqrt(ns+1) .* A.^ns ./ ( gamma2(ns+1) .* ( 2.^(ns/2) ) );                       % regular n-simplex volume
    S  = ns .* (ns+1) .* sqrt(ns) .* A.^(ns-1) ./ ( gamma2(ns+1) .* ( 2.^((ns-1)/2) ) ); % regular n-simplex surface
    V2 = V .* ns .* sqrt(ns) ./ sqrt( ns.^(3) );                                         % regular n-simplex volume 2nd branch 
    S2 = S .* (ns-1) .* sqrt(ns-1) ./ sqrt( (ns-1).^3 );                                 % regular n-simplex surface 2nd branch
  case('O') % n-orthoplex
    V  = ( 2.^(ns/2) ) .* A.^ns ./ gamma2(ns+1);                                         % n-orthoplex volume  
    V2 = V;                                                                              % (n-orthoplex volume does not branch)
    S  = ns .* 2.^((ns+1)/2) .* sqrt(ns) .* A.^(ns-1) ./ gamma2(ns+1);                   % n-orthoplex surface
    S2 = S .* (ns-1) .* sqrt(ns-1) ./ sqrt( (ns-1).^3 );                                 % n-orthoplex surface 2nd branch
  case('C') % n-cube
    V  = A.^ns;                                                                          % n-cube volume
    V2 = V;                                                                              % (n-cube volume  does not branch)
    S  = 2 .* ns .* A.^(ns-1);                                                           % n-cube surface
    S2 = S;                                                                              % (n-cube surface does not branch)
  case('B')
    V  = ( 2.^(-ns) ) .* ( pi.^(ns/2) ) .* D.^ns ./ gamma2((ns/2)+1);                    % n-ball volume
    V2 = V;                                                                              % (n-ball volume  does not branch)
    S  = ( 2.^(1-ns) ) .* ns .* ( pi.^(ns/2) ) .* D.^(ns-1) ./ gamma2((ns/2)+1);         % n-ball surface
    S2 = S;                                                                              % (n-ball surface does not branch)    
  otherwise
    error 'Wrong kind of formula; can be ''SIB'', ''SCB'', ''OIB'', ''OCB'', ''CIB'', ''CCB'', ''SIM'', ''ORT'', ''CUB'', ''BAL''';
end
 
%VCIBr = (i.^-ns) .* ( (-ns).^(-ns./2) );                                              % VCIB reflection relation
%SCIBr = -2 .* i.^(-ns+1) .* (-ns).^((3-ns)./2);                                       % SCIB reflection relation

return
