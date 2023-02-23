function [Vrel Srel] = vsrel(n, kind)
% Relations between volumes (n, -n) and surfaces (n, 2-n) 
% of n-simplices, n-orthoplices, n-cubes, and n-balls including inscribed in and circumscribed about the latter
% INPUT:
% n     - vector of dimensions to which V and S is returned
% kind  - kind of formula; can be 'SIB', 'SCB', 'OIB', 'OCB', 'CIB', 'CCB', 'SIM', 'ORT', 'CUB', 'BAL'
% 'BAL' - n-ball
% 'SIM' - regular n-simplex
% 'ORT' - n-orthoplex
% 'SIB' - regular n-simplex inscribed in n-ball
% 'SCB' - regular n-simplex circumscribed about n-ball
% 'OIB' - n-orthoplex inscribed in n-ball
% 'OCB' - n-orthoplex circumscribed about n-ball
% 'CIB' - n-cube inscribed in n-ball
% 'CCB' - n-cube circumscribed about n-ball
% 'CUB' - n-cube

% OUTPUT:
% Vrel  - volume relation (principal branch)
% Srel  - surface relation (principal branch)
%% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 03.10.2022
% v2: 21.02.2023 (clean up)

if nargin < 2
    error 'Wrong number of arguments in vsrel.';
end

switch kind
  case{'BAL'}
    Vrel = 2*sin(pi*n/2) ./ (pi*n);                                                                            % VBAL(n)*VBAL(-n)
    Srel = 4*sin(pi*n/2);                                                                                      % SBAL(n)*SBAL(2-n)
  case{'SIM'}
    Vrel = sqrt(1+n) .* sqrt(1-n) .* sin(pi*n) ./ (pi*n);                                                      % VSIM(n)*VSIM(-n)
    Srel = n.^(1/2) .* (n+1) .* (2-n).^(1/2) .* (3-n) .* sin(pi*n) ./ (pi .* (1-n));                           % SSIM(n)*SSIM(2-n)
  case{'ORT'}
    Vrel = sin(pi*n) ./ (pi*n);                                                                                % VORT(n)*VORT(-n)
    Srel = 4*n.^(1/2) .* (2-n).^(1/2) .* sin(pi*n) ./ (pi .* (1-n));                                           % SORT(n)*SORT(2-n)
  case{'SIB'}
    Vrel = (1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* ( n).^(-n/2) .* (-n).^( n/2) .* sin(pi*n) ./ (pi*n);        % VSIB(n)*VSIB(-n)
    Srel = n.^((2-n)/2) .* (n+1).^((n+1)/2) .* (2-n).^(n/2) .* (3-n).^((3-n)/2) .* sin(pi*n) ./ (pi .* (1-n)); % SSIB(n)*SSIB(2-n)
  case{'SCB'}
    Vrel = (1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* (-n).^(-n/2) .* ( n).^( n/2) .* sin(pi*n) ./ (pi*n);        % VSCB(n)*VSCB(-n)
    Srel = n.^(n/2) .* (n+1).^((n+1)/2) .* (2-n).^((2-n)/2) .* (3-n).^((3-n)/2) .* sin(pi*n) ./ (pi .* (1-n)); % SSCB(n)*SSCB(2-n)
  case{'OIB'}
    Vrel = sin(pi*n) ./ (pi*n);                                                                                % VOIB(n)*VOIB(-n)
    Srel = 4 * n.^(1/2) .* (2-n).^(1/2) .* sin(pi*n) ./ (pi*(1-n));                                            % SOIB(n)*SOIB(2-n)
  case{'OCB'}
    Vrel = ( n).^( n/2) .* (-n).^(-n/2) .* sin(pi*n) ./ (pi*n);                                                % VOCB(n)*VOCB(-n)
    Srel = 4 * n.^(n/2) .* (2-n).^((2-n)/2) .* sin(pi*n) ./ (pi .* (1-n));                                     % SOCB(n)*SOCB(2-n)    
  case{'CIB'}
    Vrel = i.^n;                                                                                               % VCIB(n)*VCIB(-n)
    Srel = 4 * n.^((3-n)/2) .* (2-n).^((1+n)/2);                                                               % SCIB(n)*SCIB(2-n)    
  case{'CCB', 'CUB'}
    Vrel = ones(1, length(n));                                                                                 % VCCB(n)*VCCB(-n)
    Srel = 4*  n .* (2-n);                                                                                     % SCCB(n)*SCCB(2-n)
  otherwise
    error 'Wrong kind of formula; can be ''SIB'', ''SCB'', ''OIB'', ''OCB'', ''CIB'', ''CCB'', ''SIM'', ''ORT'', ''BAL''';
end

%VCIBr = (i.^-ns) .* ( (-ns).^(-ns./2) );                                              % VCIB reflection relation
%SCIBr = -2 .* i.^(-ns+1) .* (-ns).^((3-ns)./2);                                       % SCIB reflection relation

return
