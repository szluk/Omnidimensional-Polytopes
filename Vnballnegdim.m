%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 18.08.2022

clear all

% other radii
res=25;
nRe   = linspace(-8, 12, res);
nIm   = linspace(-2 ,  2, res);
[NRE,NIM] = meshgrid(nRe, nIm);

R_k    = 1

%NRE = 2
%NIM = -3

%Rfct   = (R_k.^NRE) .* ( cos( NIM.*log(R_k) ) + i*sin( NIM.*log(R_k) ) );
Rfct   = R_k.^(NRE + i*NIM);
VGM   = Rfct .* ( pi.^((NRE + i*NIM)/2) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 );
SGM   = (NRE + i*NIM) .* VGM ./ R_k;

%VGM1 = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos((NIM./2)*log(pi)) + i*sin((NIM./2)*log(pi)) ) * ( cos(NIM.*log(R_k)) + i*sin(NIM.*log(R_k)) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK
%VGM1  = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos((NIM./2)*log(pi))*cos(NIM.*log(R_k)) + i*cos((NIM./2)*log(pi))*sin(NIM.*log(R_k)) + i*sin((NIM./2)*log(pi))*cos(NIM.*log(R_k)) - sin((NIM./2)*log(pi))*sin(NIM.*log(R_k)) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK
%VGM1  = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos( (NIM./2)*log(pi) - NIM.*log(R_k) ) + i*cos((NIM./2)*log(pi))*sin(NIM.*log(R_k)) + i*sin((NIM./2)*log(pi))*cos(NIM.*log(R_k)) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK
%VGM1  = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos( (NIM./2)*log(pi) - NIM.*log(R_k) ) + i*sin( (NIM./2)*log(pi) + NIM.*log(R_k) ) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK
%VGM1  = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos( NIM.*log(sqrt(pi)) - NIM.*log(R_k) ) + i*sin( NIM.*log(sqrt(pi)) + NIM.*log(R_k) ) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK
%VGM1  = (pi.^(NRE/2)) * (R_k.^NRE) * ( cos( NIM.*(log( sqrt(pi)) - log(R_k) ) ) + i*sin( NIM.*(log(sqrt(pi)) + NIM.*log(R_k) ) ) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK

VGM1  = (pi.^(NRE/2)) .* (R_k.^NRE) .* ( cos( NIM.*log( sqrt(pi)/R_k ) ) + i*sin( NIM.*log( sqrt(pi)*R_k) ) ) ./ gamma2( ((NRE + i*NIM)/2) + 1 ); %OK

VGMnew= R_k .* ( pi.^((nRe)/2) ) ./ gamma2( ((nRe)/2) + 1 );

%return

figure
hold on
mesh(NRE,NIM,abs(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('abs(V)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)
plot3(real(nRe), imag(nRe), VGMnew, 'k')
view(-20, 20);

%figure
%mesh(NRE,NIM,abs(VGM1))
%xlabel('Re(n)')
%ylabel('Im(n)')
%zlabel('abs(V)')
%title( sprintf( 'R=%f', R_k) )
%rotate3d on
%return

figure
hold on
mesh(NRE,NIM,real(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Re(V)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)
plot3(real(nRe), imag(nRe), VGMnew, 'k')
view(-20, 20);

figure
mesh(NRE,NIM,imag(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Im(V)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
line([min(nRe) max(nRe)], [0 0], [0 0], 'Color',[0 0 0]);
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)
view(-20, 20);

return

figure
mesh(NRE,NIM,abs(SGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('abs(S)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

figure
mesh(NRE,NIM,real(SGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Re(S)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

figure
mesh(NRE,NIM,imag(SGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Im(S)')
title( sprintf( 'R=%f', R_k) )
rotate3d on
line([min(nRe) max(nRe)], [0 0], [0 0], 'Color',[0 0 0]);
set(gca,'FontName', 'Times New Roman')
set(gca,'FontSize', 12)

return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% testujemy orthoplexy i simplexy (A=1) start
nRe   = linspace(-4, 6, res);
nIm   = linspace(-.5,  .5, res);
[NRE,NIM] = meshgrid(nRe, nIm);

VGM   = ( 2.^((NRE + i*NIM)/2) ) ./ gamma2( NRE + i*NIM + 1 ); % orthoplex 
VGM   = ( 2.^-((NRE + i*NIM)/2) ) .* ( ((NRE + i*NIM)+1).^(1/2) ) ./ gamma2( NRE + i*NIM + 1 ); % simplex

figure
mesh(NRE,NIM,abs(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('abs(V)')
rotate3d on

figure
mesh(NRE,NIM,real(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Re(V)')
rotate3d on

figure
mesh(NRE,NIM,imag(VGM))
xlabel('Re(n)')
ylabel('Im(n)')
zlabel('Im(V)')
rotate3d on

return

% testujemy orthoplexy end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% unit radius assumed
nRe   =-12.2:.1:12;
nIm   =-4:.033:4;

[NRE,NIM] = meshgrid(nRe, nIm);

FEVN = 1       ./gamma2( ( NRE + i*NIM )/2 +1);
FODD = sqrt(pi)./gamma2( ( NRE + i*NIM )/2 +1);
%VGM  = ( pi.^((NRE + i*NIM)/2) ) / gamma2( ((NRE + i*NIM)/2) + 1 );

for k=1:length(nRe)
  for l=1:length(nIm)
      fevn(k, l) = 1       /gamma2( ( nRe(k) + i*nIm(l) )/2 +1);
      fodd(k, l) = sqrt(pi)/gamma2( ( nRe(k) + i*nIm(l) )/2 +1);
      VGM (k, l) = ( pi.^((nRe(k) + i*nIm(l))/2) ) / gamma2( ((nRe(k) + i*nIm(l))/2) + 1 );
      SGM (k, l) = (nRe(k) + i*nIm(l))*VGM (k, l);
  end
end  

figure
hold on
mesh(NIM, NRE, abs(VGM) );
title('VGM')
rotate3d on

figure
mesh(NIM, NRE, abs(SGM) );
title('SGM')
rotate3d on
return


re = -5:5;
im = -5:5;
idx=1;
for k=1:length(re)
  for l=1:length(im)
    z(idx) = re(k) + i*im(l);
    idx = idx + 1;
  end
end  

res = ( pi.^floor(z/2) ) .* ( pi.^floor((2-z)/2) );
res'

abs(res)'

return
