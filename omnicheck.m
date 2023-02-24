clear all

% verification of relations presented in Sections VI. METRIC-INDEPENDENT RELATIONS and VII. VOLUME-SURFACE SYMMETRIES

% METRIC AND GAMMA FUNCTION INDEPENDENT RELATIONS
D=-11.21*i;
D=1;
% generate an array of complex numbers n
dlt = .25;
a=-2:dlt:2;
b=-2:dlt:2;
idx=1;
for k=1:length(a)
  for l=1:length(b)
    if a(k) == 0 && b(l) == 0 % volume relations
    %if a(k) == 1 && b(l) == 0 % surface relations
      continue
    end
    n(idx) = a(k) + i*b(l);
    idx = idx + 1;
  end
end

%myisequal( -sin(pi*(n+1)), sin(pi*n), 1.0e-13)

n=-2:.33:2;

% METRIC AND GAMMA FUNCTION INDEPENDENT RELATIONS (c.d.)
[VCCBp VCCBRp SCCBp SCCBRp] = vsomni(n, 'CCB', D);
[VCIBp VCIBRp SCIBp SCIBRp] = vsomni(n, 'CIB', D);
[VSCBp VSCBRp SSCBp SSCBRp] = vsomni(n, 'SCB', D);
[VSIBp VSIBRp SSIBp SSIBRp] = vsomni(n, 'SIB', D);
[VOCBp VOCBRp SOCBp SOCBRp] = vsomni(n, 'OCB', D);
[VOIBp VOIBRp SOIBp SOIBRp] = vsomni(n, 'OIB', D);

%{SCBR_TO_SIBR}
myisequal(VSCBRp, VSIBRp .* i.^(2*n) .* (-n).^n, 1.0e-10) % does not hold
myisequal(SSCBRp, SSIBRp .* i.^(2+2*n) .* (-n).^(n-1), 1.0e-10) % does not hold

%return

%{CCB_TO_CIB} 
myisequal(VCCBp, VCIBp .* n.^(n    /2), 1.0e-15)   % checked
myisequal(SCCBp, SCIBp .* n.^((n-1)/2), 1.0e-15)   % checked
%{SCB_TO_SIB}
myisequal(VSCBp, VSIBp .* n.^n,         1.0e-15)   % checked
myisequal(SSCBp, SSIBp .* n.^(n-1),     1.0e-15)   % checked
%{OCB_TO_OIB}
myisequal(VOCBp, VOIBp .* n.^(n/2),     1.0e-15)   % checked
myisequal(SOCBp, SOIBp .* n.^((n-1)/2), 1.0e-15)   % checked

return

% VOLUME-SURFACE SYMMETRIES
% checking particular symmetries between $n=-1/2$ and $n=1/2$

np12 =  1/2;
nn12 = -1/2;
D = 1;

[VSIBn VSIBRn SSIBn SSIBRn] = vsomni(nn12, 'SIB', D);
[VSIBp VSIBRp SSIBp SSIBRp] = vsomni(np12, 'SIB', D);

[VSCBn VSCBRn SSCBn SSCBRn] = vsomni(nn12, 'SCB', D);
[VSCBp VSCBRp SSCBp SSCBRp] = vsomni(np12, 'SCB', D);

[VOIBn a SOIBn a] = vsomni(nn12, 'OIB', D);
[VOIBp a SOIBp a] = vsomni(np12, 'OIB', D);

[VOCBn a SOCBn a] = vsomni(nn12, 'OCB', D);
[VOCBp a SOCBp a] = vsomni(np12, 'OCB', D);

[VCIBn a SCIBn a] = vsomni(nn12, 'CIB', D);
[VCIBp a SCIBp a] = vsomni(np12, 'CIB', D);

[VCCBn a SCCBn a] = vsomni(nn12, 'CCB', D);
[VCCBp a SCCBp a] = vsomni(np12, 'CCB', D);

[VBALn a SBALn a] = vsomni(nn12, 'BAL', D);
[VBALp a SBALp a] = vsomni(np12, 'BAL', D);

[VSIMn a SSIMn a] = vsomni(nn12, 'SIM', D);
[VSIMp a SSIMp a] = vsomni(np12, 'SIM', D);

[VORTn a SORTn a] = vsomni(nn12, 'ORT', D);
[VORTp a SORTp a] = vsomni(np12, 'ORT', D);

% {VBAL_SBAL_12}
VBALn
-SBALn

VBALp
SBALp

% {VSIM_SSIM_12} 
VSIMn
2*i*sqrt(2)*SSIMn

VSIMp
SSIMp*2*sqrt(2/3)

% {VORT_SORT_12} 
VORTp
2*SORTp

VORTn
i*2*SORTn

% {VSIB_SSIB_12}
VSIBn
2*SSIBn

VSIBp
2*SSIBp

% {VSCB_SSCB_12} 
VSCBn
-SSCBn

VSCBp
SSCBp

% {VOIB_SOIB_12} 
VOIBn
i*sqrt(2)*SOIBn

VOIBp
sqrt(2)*SOIBp

% {VOCB_SOCB_12} 
VOCBn
-SOCBn

VOCBp
SOCBp

% {VCIB_SCIB_12} 
VCIBn
sqrt(2)*conj(SCIBn)

VCIBp
sqrt(2)*SCIBp

% {VCCB_SCCB_12} 
VCCBn
-SCCBn
%SCCBn

VCCBp
SCCBp

% {SOIB_S_CIB_32} 
np2  =  2;
np3  =  3;
[a a SOIB3 a ] = vsomni(np3, 'OIB', D);
[a a SSIM3 a ] = vsomni(np3, 'SIM', D);
SOIB3
SSIM3

[a a SOIB2 a ] = vsomni(np2, 'OIB', D);
[a a SCIB2 a ] = vsomni(np2, 'CIB', D);
SOIB2
SCIB2

return

% {VBALp_VBALn}, {SBALp_SBAL2n}  
[VBALp a SBALp a] = vsomni( n,  'BAL', D);
[VBALn a SBALn a] = vsomni(-n,  'BAL', D);
[VBAL2 a SBAL2 a] = vsomni(2-n, 'BAL', D);
VBALp_VBALn  = myisequal( VBALp.*VBALn,  2*sin(pi*n/2) ./ (pi*n), 1.0e-15)   % checked
SBALp_SBAL2n = myisequal( SBALp.*SBAL2,  4*sin(pi*n/2)          , 1.0e-13)   % checked
[V S] = vsrel(n, 'BAL');
VBALp_VBALn  = myisequal( VBALp.*VBALn, V, 1.0e-15)   % checked
SBALp_SBAL2n = myisequal( SBALp.*SBAL2, S, 1.0e-13)   % checked

% {VSIMp_VSIMn}, {SSIMp_SSIM2n}
[VSIMp a SSIMp a] = vsomni( n,  'SIM', D);
[VSIMn a SSIMn a] = vsomni(-n,  'SIM', D);
[VSIM2 a SSIM2 a] = vsomni(2-n, 'SIM', D);
VSIMp_VSIMn  = myisequal( VSIMp.*VSIMn, (1+n).^(1/2) .* (1-n).^(1/2) .* sin(pi*n) ./ (pi*n), 1.0e-13)   % checked
SSIMp_SSIM2n = myisequal( SSIMp.*SSIM2, n.^(1/2) .* (1+n) .* (2-n).^(1/2) .* (3-n) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-12)   % checked
[V S] = vsrel(n, 'SIM');
VSIMp_VSIMn  = myisequal( VSIMp.*VSIMn, V, 1.0e-13)   % checked
SSIMp_SSIM2n = myisequal( SSIMp.*SSIM2, S, 1.0e-12)   % checked


% {VORTp_VORTn}, {SORTp_SORT2n}
[VORTp a SORTp a] = vsomni( n,  'ORT', D);
[VORTn a SORTn a] = vsomni(-n,  'ORT', D);
[VORT2 a SORT2 a] = vsomni(2-n, 'ORT', D);
VORTp_VORTn  = myisequal( VORTp.*VORTn, sin(pi*n) ./ (pi*n), 1.0e-13)   % checked
SORTp_SORT2n = myisequal( SORTp.*SORT2, 4 * n.^(1/2) .* (2-n).^(1/2) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-13)   % checked
[V S] = vsrel(n, 'ORT');
VORTp_VORTn  = myisequal( VORTp.*VORTn, V, 1.0e-13)   % checked
SORTp_SORT2n = myisequal( SORTp.*SORT2, S, 1.0e-13)   % checked


[VOIBp a SOIBp a] = vsomni( n,  'OIB', D);
[VOIBn a SOIBn a] = vsomni(-n,  'OIB', D);
[VOIB2 a SOIB2 a] = vsomni(2-n, 'OIB', D);
VOIBp_VOIBn  = myisequal( VOIBp.*VOIBn, sin(pi*n) ./ (pi*n), 1.0e-13)   % checked
% {SOIBp_SOIB2n}
SOIBp_SOIB2n = myisequal( SOIBp.*SOIB2, 4 * n.^(1/2) .* (2-n).^(1/2) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-13)   % checked
[V S] = vsrel(n, 'OIB');
VOIBp_VOIBn  = myisequal( VOIBp.*VOIBn, V, 1.0e-13)   % checked
SOIBp_SOIB2n = myisequal( SOIBp.*SOIB2, S, 1.0e-13)   % checked

% {VSIBp_VSIBn}, {SSIBp_SSIB2n}
[VSIBp a SSIBp a] = vsomni( n,  'SIB', D);
[VSIBn a SSIBn a] = vsomni(-n,  'SIB', D);
[VSIB2 a SSIB2 a] = vsomni(2-n, 'SIB', D);
VSIBp_VSIBn  = myisequal( VSIBp.*VSIBn, (1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* ( n).^(-n/2) .* (-n).^( n/2) .* sin(pi*n) ./ (pi*n), 1.0e-13)   % checked
SSIBp_SSIB2n = myisequal( SSIBp.*SSIB2, n.^((2-n)/2) .* (n+1).^((n+1)/2) .* (2-n).^(n/2) .* (3-n).^((3-n)/2) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-12)   % checked
[V S] = vsrel(n, 'SIB');
VSIBp_VSIBn  = myisequal( VSIBp.*VSIBn, V, 1.0e-13)   % checked
SSIBp_SSIB2n = myisequal( SSIBp.*SSIB2, S, 1.0e-12)   % checked

% {VSCBp_VSCBn}, {SSCBp_SSCB2n}
[VSCBp a SSCBp a] = vsomni( n,  'SCB', D);
[VSCBn a SSCBn a] = vsomni(-n,  'SCB', D);
[VSCB2 a SSCB2 a] = vsomni(2-n, 'SCB', D);
VSCBp_VSCBn  = myisequal( VSCBp.*VSCBn, (1+n).^((1+n)/2) .* (1-n).^((1-n)/2) .* (-n).^(-n/2) .* ( n).^( n/2) .* sin(pi*n) ./ (pi*n), 1.0e-15)   % checked
SSCBp_SSCB2n = myisequal( SSCBp.*SSCB2, n.^((n)/2) .* (n+1).^((n+1)/2) .* (2-n).^((2-n)/2) .* (3-n).^((3-n)/2) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-13)   % checked
[V S] = vsrel(n, 'SCB');
VSCBp_VSCBn  = myisequal( VSCBp.*VSCBn, V, 1.0e-15)   % checked
SSCBp_SSCB2n = myisequal( SSCBp.*SSCB2, S, 1.0e-13)   % checked

% {VOCBp_VOCBn}, {SOCBp_SOCB2n}
[VOCBp a SOCBp a] = vsomni( n,  'OCB', D);
[VOCBn a SOCBn a] = vsomni(-n,  'OCB', D);
[VOCB2 a SOCB2 a] = vsomni(2-n, 'OCB', D);
VOCBp_VOCBn  = myisequal( VOCBp.*VOCBn, ( n).^( n/2) .* (-n).^(-n/2) .* sin(pi*n) ./ (pi*n), 1.0e-15)   % checked
SOCBp_SOCB2n = myisequal( SOCBp.*SOCB2, 4 *n.^((n)/2) .* (2-n).^((2-n)/2) .* sin(pi*n) ./ (pi*(1-n)), 1.0e-13)   % checked
[V S] = vsrel(n, 'OCB');
VOCBp_VOCBn  = myisequal( VOCBp.*VOCBn, V, 1.0e-15)   % checked
SOCBp_SOCB2n = myisequal( SOCBp.*SOCB2, S, 1.0e-13)   % checked

% {SCIBp_SCIB2n}
[VCIBp a SCIBp a] = vsomni( n,  'CIB', D);
[VCIB2 a SCIB2 a] = vsomni(2-n, 'CIB', D);
SCIBp_SCIB2n = myisequal( SCIBp.*SCIB2, 4 * n.^((3-n)/2) .* (2-n).^((1+n)/2), 1.0e-14)   % checked 
[V S] = vsrel(n, 'CIB');
SCIBp_SCIB2n = myisequal( SCIBp.*SCIB2, S, 1.0e-14)   % checked 

return


%VCIBp.*VCIBnR - i.^n
