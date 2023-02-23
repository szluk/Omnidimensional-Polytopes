clear all

n = -6:.001:6;
n = -6:.05:6; %dla testów tabelowych

kind = 'OCB';
D = 1;

[VB VBR SB SBR] = vsomni(n, 'BAL', D);
VB2 = -VB;
VBR2= -VBR;
SB2 = -SB;  
SBR2= -SBR;

[V  VR S SR] = vsomni(n, kind, D);
V2 = -V;
VR2= -VR;
S2 = -S;
SR2= -SR;

if kind(1) == 'S'
  % simplices
  dark = [157 10 14]/255;
%  dark = [0 0 0]/255;%%%
  col  = 'r'
elseif kind(1) == 'O'
  % orthoplices
  dark = [0 166 80]/255;
  col  = 'g'
elseif kind(1) == 'C'
  % cubes
  dark = [236 0 140]/255;
  col  = [255 0 255]/255;
end

% volume
figure
hold on
%title('volume')
plot3(n, imag(VB),   real(VB),   'b');
plot3(n, imag(VB2),  real(VB2),  'b');

plot3(n, imag(VR ),  real(VR ),  'Color', dark, 'LineStyle', ':', 'LineWidth', 2);
plot3(n, imag(VR2),  real(VR2),  'Color', dark, 'LineStyle', ':', 'LineWidth', 2);
plot3(n, imag(V ),   real(V ),   'Color', col, 'LineWidth', 2);
plot3(n, imag(V2),   real(V2),   'Color', col, 'LineWidth', 2);

line([min(n) max(n)], [0 0], [0 0], 'Color',[0 0 0]);

axis([min(n) max(n) -2 2 -1.5 1.5])

set(gca,'XTick',min(n):1:max(n))
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

xlabel('{\it n}')
%ylabel('Im({\itV_{SIB}})')
ylabel(strcat('Im({\itV_{', kind, '}})'))
%zlabel('Re({\itV_{SIB}})')
zlabel(strcat('Re({\itV_{', kind, '}})'))
%zlabel(strcat('\itV_{OIB}'))

grid on
rotate3d on
view(10, 20);

%return

% surface
figure
hold on
%title('surface')
plot3(n, imag(SB),   real(SB),   'b');
plot3(n, imag(SB2),  real(SB2),  'b');

plot3(n, imag(SR ),  real(SR ),  'Color', dark, 'LineStyle', ':', 'LineWidth', 2);
plot3(n, imag(SR2),  real(SR2),  'Color', dark, 'LineStyle', ':', 'LineWidth', 2);
plot3(n, imag(S ),   real(S ),   'Color', col, 'LineWidth', 2);
plot3(n, imag(S2),   real(S2),   'Color', col, 'LineWidth', 2);

line([min(n) max(n)], [0 0], [0 0], 'Color',[0 0 0]);

axis([min(n) max(n) -2 2 -5 5])

set(gca,'XTick', min(n):1:max(n))
%set(gca,'ZTick', -5:1:5)
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

xlabel('{\it n}')
%ylabel('Im({\itS_{SIB}})')
ylabel(strcat('Im({\itS_{', kind, '}})'))
%zlabel('Re({\itS_{SIB}})')
zlabel(strcat('Re({\itS_{', kind, '}})'))

grid on
rotate3d on
view(10, 20);
