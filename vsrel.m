function [Vrel Vrel2 Srel Srel2] = vsrel(n, kind)
% Relations between volumes (n, -n) and surfaces (n, 2-n) of n-simplices, n-orthoplices, n-cubes, and n-balls including inscribed in and circumscribed about the latter
% INPUT:
% n    - vector of dimensions to which V and S is returned
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
% OUTPUT:
% Vrel  - volume relation main branch
% Vrel2 - volume relation 2nd branch #TODO
% Srel  - surface relation main branch
% Srel2 - surface relation 2nd branch #TODO
%% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 03.10.2022

if nargin < 2
    error 'Wrong number of arguments in vsrel.';
end

switch kind
  case('SIB')
    Vrel = -(i.^n) .* (1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* sin(pi*(n+1)) ./ (pi*n);                              % VSIB(n)*VSIB(-n)  #CHCKD
    Srel = -n.^((2-n)/2) .* (n+1).^((n+1)/2) .* (2-n).^(n/2) .* (3-n).^((3-n)/2) .* sin(pi*(n+1)) ./ (pi .* (1-n)); % SSIB(n)*SSIB(2-n)
  case('SCB')
    Vrel = -(1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* sin(pi*(n+1)) ./ (pi*n .* i.^n);                                % VSCB(n)*VSCB(-n)  #CHCKD
    Srel = -n.^(n/2) .* (n+1).^((n+1)/2) .* (2-n).^((2-n)/2) .* (3-n).^((3-n)/2) .* sin(pi*(n+1)) ./ (pi .* (1-n)); % SSCB(n)*SSCB(2-n)
  case{'OIB', 'ORT'}
    Vrel = -sin(pi*(n+1)) ./ (pi*n);                                                                                % VOIB(n)*VOIB(-n)  #CHCKD
    Srel = -4*n.^(1/2) .* (2-n).^(1/2) .* sin(pi*(n+1)) ./ (pi .* (1-n));                                           % SOIB(n)*SOIB(2-n)
  case('OCB')
    Vrel = -sin(pi*(n+1)) ./ (pi*n .* i.^n);                                                                        % VOCB(n)*VOCB(-n)  #CHCKD
    Srel = -4 * n.^(n/2) .* (2-n).^((2-n)/2) .* sin(pi*(n+1)) ./ (pi .* (1-n));                                     % SOCB(n)*SOCB(2-n)    
  case('CIB')
    Vrel = i.^n;                                                                                                    % VCIB(n)*VCIB(-n)  #CHCKD
    Srel = 4 * n.^((3-n)/2) .* (2-n).^((1+n)/2);                                                                    % SCIB(n)*SCIB(2-n)    
  case('CCB')
    Vrel = ones(1, length(n));                                                                                      % VCCB(n)*VCCB(-n)  #CHCKD
    Srel = 4*  n .* (2-n);                                                                                          % SCCB(n)*SCCB(2-n)
  case('SIM')
    Vrel = -sqrt(1+n) .* sqrt(1-n) .* sin(pi*(n+1)) ./ (pi*n);                                                      % VS  (n)*VS  (-n)  #CHCKD
    Srel = -n.^(1/2) .* (n+1) .* (2-n).^(1/2) .* (3-n) .* sin(pi*(n+1)) ./ (pi .* (1-n));                           % SS  (n)*SS  (2-n)    
  case('BAL')
    Vrel = 2*sin(pi*n/2) ./ (pi*n);                                                                                 % VB  (n)*VB  (-n)  #CHCKD
    Srel = 4*sin(pi*n/2);                                                                                           % SB  (n)*SB  (2-n)
    %Srel = -4*sin(pi*(n/2+1));                                                                                     % SB  (n)*SB  (2-n)    
  otherwise
    error 'Wrong kind of formula; can be ''SIB'', ''SCB'', ''OIB'', ''OCB'', ''CIB'', ''CCB'', ''SIM'', ''ORT'', ''BAL''';
end

Vrel2 = Vrel;
Srel2 = 0;

%VCIBr = (i.^-ns) .* ( (-ns).^(-ns./2) );                                              % VCIB reflection relation
%SCIBr = -2 .* i.^(-ns+1) .* (-ns).^((3-ns)./2);                                       % SCIB reflection relation

return
