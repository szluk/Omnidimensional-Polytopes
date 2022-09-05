%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 18.08.2022
% v2: 05.09.2022

clear all

n=-4:6;
%n=-30:6;
%n=-7:6;
dlt = .01;
ns=min(n):dlt:max(n);

voloorsurf = 'volumes';
%voloorsurf = 'surfaces';
%voloorsurf = 'both';

% diameter
D = 1;

% edge length
Ai = 1;
A  = 1; 

%A = sqrt(ns+1) ./ sqrt(2) ./ sqrt(ns); % ASIB
A = sqrt(ns) .* sqrt(ns+1) ./ sqrt(2); % ASCB

%A = 1 ./ sqrt(2);                      % AOIB
%A = sqrt(ns) ./ sqrt(2);               % AOCB

%A = 1 ./ sqrt(ns);                     % ACIB 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VOLUMES
VB  = ( 2.^(-ns) ) .* ( pi.^(ns/2) ) .* D.^ns ./ gamma2((ns/2)+1);                    % ball volume
VBi = ( 2.^(-n) )  .* ( pi.^(n/2) )  .* D.^n ./ gamma2((n/2)+1);                      % ball volume for integer n's
%VBc = 2*pi .* ( pi.^((ns-2)/2) ) .* D.^ns ./ ( ns .* gamma2(ns/2) .* (2.^ns) );      % ball volume direct check OK - ball does not branch at 0

VS  = sqrt(ns+1) .* A.^ns ./ ( gamma2(ns+1) .* ( 2.^(ns/2) ) );                       % simplex volume
VSi = sqrt(n+1)  .* Ai.^n ./ ( gamma2(n+1)  .* ( 2.^(n/2) ) );                        % simplex volume for integer n's
VSt = VS .* ns .* sqrt(ns) ./ sqrt( ns.^(3) );                                        % simplex volume negative
VSIB = (ns.^(3/2) .* (ns + 1).^(1/2) .* ((ns + 1).^(1/2) ./ (2.*ns.^(1/2))).^ns) ./ ( gamma2(ns+1) .* (ns.^3).^(1/2) ); % VSIB general form
VSIB1= (ns+1).^((ns+1)/2)  ./ ( 2.^ns .* ns.^(ns/2) .* gamma2(ns+1) );               % VSIB positive
VSCB = ns.^(3/2) .* (ns+1).^(1/2) .* ns.^(ns/2) .* (ns+1).^(ns/2) ./( gamma2(ns+1).*(ns.^3).^(1/2) .* 2.^ns ); % VSCB general form
VSCB1= ns.^(ns/2) .* (ns+1).^((ns+1)/2) ./( gamma2(ns+1) .* 2.^ns );                  % VSCB positive

VO  = ( 2.^(ns/2) ) .* A.^ns ./ gamma2(ns+1);                                         % orthoplex volume
VOi = ( 2.^(n/2) )  .* Ai.^n ./ gamma2(n+1);                                          % orthoplex volume for integer n's
%VOc = 2^(1/2) .* ( 2.^((ns-1)/2) ) .* A.^ns ./ ns ./gamma2(ns);                      % orthoplex volume direct check OK - orthoplex does not branch at 0
VOIB= 1 ./ gamma2(ns+1);                                                              % VOIB (orthoplex volume does not branch)   
VOCB= ns .^ (ns./2) ./ gamma2(ns+1);                                                  % VOCB (orthoplex volume does not branch)

VC  = A.^ns;                                                                          % cube volume
VCIB  = ( sqrt(ns) ) .^ (-ns) ;                                                       % VCIB
VCIBr = (i.^-ns) .* ( (-ns).^(-ns./2) );                                              % VCIB reflection relation

% SURFACES
SB  = ( 2.^(1-ns) ) .* ns .* ( pi.^(ns/2) ) .* D.^(ns-1) ./ gamma2((ns/2)+1);         % ball surface
SBi = ( 2.^(1-n) )  .* n  .* ( pi.^(n/2) )  .* D.^(n-1)  ./ gamma2((n/2)+1);          % ball surface for integer n's

SS  = ns .* (ns+1) .* sqrt(ns) .* A.^(ns-1) ./ ( gamma2(ns+1) .* ( 2.^((ns-1)/2) ) ); % simplex surface
SSi = n  .* (n+1)  .* sqrt(n)  .* Ai.^(n-1) ./ ( gamma2(n+1)  .* ( 2.^((n-1)/2) ) );  % simplex surface for integer n's
SSt = SS .* (ns-1) .* sqrt(ns-1) ./ sqrt( (ns-1).^3 );                                % simplex surface negative
SSIB= ns.^((4-ns)/2) .* 2.^(1-ns) .* (ns+1).^((ns+1)/2) ./ gamma2(ns+1);              % SSIB positive
SSCB = ns.^((2+ns)/2) .* (ns+1).^((ns+1)/2) ./ ( gamma2(ns+1) .* 2.^(ns-1)  );        % SSCB positive

SO  = ns .* 2.^((ns+1)/2) .* sqrt(ns) .* A.^(ns-1) ./ gamma2(ns+1);                   % orthoplex surface
SOi = n  .* 2.^((n+1)/2)  .* sqrt(n)  .* Ai.^(n-1) ./ gamma2(n+1);                    % orthoplex surface for integer n's
SOt = SO .* (ns-1) .* sqrt(ns-1) ./ sqrt( (ns-1).^3 );                                % orthoplex surface negative
SOIB1= ( 2 * ns.^(3/2)  ./ gamma2(ns+1) ) .* (ns-1) .* sqrt(ns-1) ./ sqrt( (ns-1).^3 ); % SOIB general
SOIB=  2 * ns.^(3/2) ./ gamma2(ns+1);                                                 % SOIB positive
SOCB= ( 2.*ns.^(ns/2 + 1) ) ./ gamma2(ns+1);                                          % SOCB positive

SC  = 2 .* ns .* A.^(ns-1);                                                           % cube surface
SCIB  = 2 .* ns.^((3-ns)./2);                                                         % SCIB
SCIBr = -2 .* i.^(-ns+1) .* (-ns).^((3-ns)./2);                                       % SCIB reflection relation

% PLOTS
%volumes
if strcmp( voloorsurf, 'volumes') | strcmp( voloorsurf, 'both')
  figure
  hold on
  %plot(n, VO1,   'r')
  %plot(ns, VO,   'g')
  %plot(ns, VOc,   'm')

  plot3(ns, imag(VS),   real(VS),   'r')
  plot3(ns, imag(VSt),  real(VSt),  'r:')
  %plot3(ns, imag(VSIB),  real(VSIB),  'm')
  %plot3(ns, imag(VSIB1),  real(VSIB1),  'g')
  %plot3(ns, imag(VSCB),  real(VSCB),  'm')
  plot3(ns, imag(VSCB1),  real(VSCB1),  'c')
  %%plot3(n, imag(VSi),  real(VSi),  'r--')

  %plot3(ns, imag(VO),   real(VO),   'g')
  %%plot3(n, imag(VOi),   real(VOi),   'g--')
  %plot3(ns, imag(VOIB),   real(VOIB),   'm')
  %plot3(ns, imag(VOCB),   real(VOCB),   'c')

  plot3(ns, imag(VB),   real(VB),   'b')
  %%plot3(n, imag(VBi),   real(VBi),   'b--')

  %%plot3(ns, imag(VC),   real(VC),   'm')
  line([min(ns) max(ns)], [0 0], [0 0], 'Color',[0 0 0]);
  line([0 0], [0 0], [-1 1], 'Color',[0 0 0], 'LineStyle',':');
  set(gca,'XTick',min(ns):1:max(ns))
  rotate3d on  
  title( 'volume')
  axis([min(ns) max(ns) -2 2 -1 1.5])
  view(10, 20);
  %xlabel('n');
  %ylabel('Im(V)');
  %zlabel('Re(V)');
  grid on
  set(gca,'FontName', 'Times New Roman')
  set(gca,'FontSize', 12)
end

%surfaces
if strcmp( voloorsurf, 'surfaces') | strcmp( voloorsurf, 'both')
  figure
  hold on
  %plot3(ns, imag(SS),   real(SS),   'r')
  %plot3(ns, imag(SSt),  real(SSt),  'r:')
  %%plot3(n, imag(SSi),  real(SSi),  'r--')
  %plot3(ns, imag(SSIB1),  real(SSIB1),  'g')
  %plot3(ns, imag(SSCB),  real(SSCB),  'g')

  plot3(ns, imag(SO),   real(SO),   'g')
  plot3(ns, imag(SOt),  real(SOt),  'g:')

  %%plot3(n, imag(SOi),  real(SOi),  'g--')
  %plot3(ns, imag(SOIB),   real(SOIB),   'm')
  %plot3(ns, imag(SOIB1),   real(SOIB1),   'c')
  %plot3(ns, imag(SOCB),   real(SOCB),   'm')

  plot3(ns, imag(SB),   real(SB),   'b')
  %plot3(n, imag(SBi),   real(SBi),   'b--')

  %plot3(ns, imag(SC),   real(SC),   'm')
  line([min(ns) max(ns)], [0 0], [0 0]);
  line([1 1], [0 0], [-2 2], 'Color',[0 0 0], 'LineStyle',':');
  set(gca,'XTick',min(ns):1:max(ns))
  rotate3d on  
  title( 'surface')
  axis([min(ns) max(ns) -2 2 -5 5])
  view(10, 20);
  grid on
  set(gca,'FontName', 'Times New Roman')
  set(gca,'FontSize', 12)
end
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
