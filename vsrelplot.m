clear all

n = -6:.001:8;
%n = -6:.05:8; %dla testów tabelowych

[VBAL SBAL] = vsrel(n, 'BAL'); BALColor = [  0   0 255]/255; % blue

[VSIM SSIM] = vsrel(n, 'SIM'); SIMColor = [255   0   0]/255; % red
[VSIB SSIB] = vsrel(n, 'SIB'); SIBColor = [139   0   0]/255; % darkred
[VSCB SSCB] = vsrel(n, 'SCB'); SCBColor = [255  69   0]/255; % orangered

[VORT SORT] = vsrel(n, 'ORT'); ORTColor = [  0 128   0]/255; % green
[VOIB SOIB] = vsrel(n, 'OIB'); OIBColor = [ 50 205  50]/255; % limegreen
[VOCB SOCB] = vsrel(n, 'OCB'); OCBColor = [154 205  50]/255; % yellowgreen

[VCUB SCUB] = vsrel(n, 'CUB'); CUBColor = [255 0 151]/255;
[VCIB SCIB] = vsrel(n, 'CIB'); CIBColor = [200 55 151]/255;

% volume
figure
hold on
%title('volume')
lw=1;
ls='-';
plot3(n, imag(VBAL), real(VBAL), 'Color', BALColor, 'LineWidth', lw);

plot3(n, imag(VSIM), real(VSIM), 'Color', SIMColor, 'LineWidth', lw);
plot3(n, imag(VSIB), real(VSIB), 'Color', SIBColor, 'LineWidth', lw, 'LineStyle', '-');
plot3(n, imag(VSCB), real(VSCB), 'Color', SCBColor, 'LineWidth', lw, 'LineStyle', '-');

plot3(n, imag(VORT), real(VORT), 'Color', ORTColor, 'LineWidth', lw);
plot3(n, imag(VOIB), real(VOIB), 'Color', OIBColor, 'LineWidth', lw, 'LineStyle', '-');
plot3(n, imag(VOCB), real(VOCB), 'Color', OCBColor, 'LineWidth', lw, 'LineStyle', '-');

%plot3(n, imag(VCUB), real(VCUB), 'Color', CUBColor, 'LineWidth', lw);
%plot3(n, imag(VCIB), real(VCIB), 'Color', CUBColor, 'LineWidth', lw, 'LineStyle', '-');

line([min(n) max(n)], [0 0], [0 0], 'Color',[0 0 0]);

axis([min(n) max(n) -1 1 -1 1])
axis([min(n) max(n) -1 1 -.1 1])

set(gca,'XTick',min(n):1:max(n))
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

xlabel('{\it n}')
ylabel('Im({\itV}({\itn}){\itV}(-{\itn}))')
zlabel('Re({\itV}({\itn}){\itV}(-{\itn}))')

grid on
rotate3d on
view(10, 20);

return

% surface
figure
hold on
%title('surface')
plot3(n, imag(SBAL), real(SBAL), 'Color', BALColor, 'LineWidth', 1);

plot3(n, imag(SSIM), real(SSIM), 'Color', SIMColor, 'LineWidth', 1);
plot3(n, imag(SSIB), real(SSIB), 'Color', SIMColor, 'LineWidth', 1);
plot3(n, imag(SSCB), real(SSCB), 'Color', SIMColor, 'LineWidth', 1);

plot3(n, imag(SORT), real(SORT), 'Color', ORTColor, 'LineWidth', 1);
plot3(n, imag(SOIB), real(SOIB), 'Color', ORTColor, 'LineWidth', 1);
plot3(n, imag(SOCB), real(SOCB), 'Color', ORTColor, 'LineWidth', 1);

plot3(n, imag(SCUB), real(SCUB), 'Color', CUBColor, 'LineWidth', 1);
plot3(n, imag(SCIB), real(SCIB), 'Color', CUBColor, 'LineWidth', 1);

line([min(n) max(n)], [0 0], [0 0], 'Color',[0 0 0]);

a=20
axis([-5 7 -a a -a a])

set(gca,'XTick', min(n):1:max(n))
%set(gca,'ZTick', -5:1:5)
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

xlabel('{\it n}')
ylabel('Im({\itS}({\itn}){\itS}(2-{\itn}))')
zlabel('Re({\itS}({\itn}){\itS}(2-{\itn}))')

grid on
rotate3d on
view(10, 20);
