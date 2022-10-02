%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 18.08.2022
% v2: 02.10.2022

clear all

n=-4:6;
%n=-30:6;
%n=-7:6;
n=-6:2;

n=0:6;
dlt = .01;
ns=min(n):dlt:max(n);
nr=-ns;

voloorsurf = 'volumes';
%voloorsurf = 'surfaces';
voloorsurf = 'both';

% diameter
D = 1;

col = 'r';
%kind= 'SIM';
kind= 'SIB';
kind= 'SCB';
col = 'g';
kind= 'OIB';
kind= 'OCB';
%col = 'm';

[V  V2  S  S2 ] = VSSOCB(ns, kind, D);
[Vr Vr2 Sr Sr2] = VSSOCB(nr, kind, D);

[VB  VB2  SB  SB2 ] = VSSOCB(ns, 'BAL', D);
[VBr VBr2 SBr SBr2] = VSSOCB(nr, 'BAL', D);

% PLOTS
%volumes
if strcmp( voloorsurf, 'volumes') | strcmp( voloorsurf, 'both')
  figure
  hold on

  plot3(ns, imag(V2), real(V2),  strcat(col, ':')); % 2nd branch 
  plot3(ns, imag(V),  real(V),   col);              % main branch will override 2nd branch if just one
  plot3(ns, imag(VB), real(VB),  'b')

  plot3(ns, imag(Vr2), real(Vr2),  strcat(col, ':')); % 2nd branch 
  plot3(ns, imag(Vr),  real(Vr),   col);              % main branch will override 2nd branch if just one
  plot3(ns, imag(VBr), real(VBr),  'b')

  line([min(ns) max(ns)], [0 0], [0 0], 'Color',[0 0 0]);
  line([0 0], [0 0], [-1 1], 'Color',[0 0 0], 'LineStyle',':');
  set(gca,'XTick',min(ns):1:max(ns))
  rotate3d on  
  title( strcat('volume ', kind) )
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

  plot3(ns, imag(S2), real(S2),strcat(col, ':')); % 2nd branch 
  plot3(ns, imag(S),  real(S), col);              % main branch will override 2nd branch if just one
  plot3(ns, imag(SB), real(SB),   'b')

  plot3(ns, imag(Sr2), real(Sr2),strcat(col, ':')); % 2nd branch 
  plot3(ns, imag(Sr),  real(Sr), col);              % main branch will override 2nd branch if just one
  plot3(ns, imag(SBr), real(SBr),   'b')

  line([min(ns) max(ns)], [0 0], [0 0], 'Color',[0 0 0]);
  line([1 1], [0 0], [-2 2], 'Color',[0 0 0], 'LineStyle',':');
  set(gca,'XTick',min(ns):1:max(ns))
  rotate3d on  
  title( strcat('surface ', kind) )
  axis([min(ns) max(ns) -2 2 -5 5])
  view(10, 20);
  grid on
  set(gca,'FontName', 'Times New Roman')
  set(gca,'FontSize', 12)
end
return
