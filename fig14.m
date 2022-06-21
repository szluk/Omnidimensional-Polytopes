clear all
%R = 1;

n=-7:9;
Vrknown(1) = -0.019; % Vrknown_-7
Vrknown(2) = 0;      % Vrknown_-6 
for k=1:length(n)
  nn       = n(k);
  [num den frac] = ballsfg(nn);
  f(k)    = frac;
  g(k)    = frac*2.^(-nn);
  if nn >= -5
    Vrknown(k) = 2*pi*Vrknown(k-2)/nn;
  end  
end

ns = -7:.001:9; % par=2000;
par =  2000;

ns = -7:.1:9; % par=20;
par = 20;

pf = pi.^floor(ns/2);

fs   = spline(n, f,  ns);
gs   = spline(n, g,  ns);
Vkrs = spline(n, Vrknown,  ns);

% fs_1  = fs(9)
% fs_21 = fs(7)

k = length(fs);
while k >= length(fs)-par
  n     = ns(k);
  fr(k) = fs(k);
  gr(k) = gs(k);  

  fe(k) = 2/( n * gamma(n/2) );
  fo(k) = sqrt(pi)/gamma(n/2 + 1);
  
  ge(k) = fe(k)*2^(-n);
  go(k) = fo(k)*2^(-n);
  k     = k - 1;  
end

k = length(fs)-par-1;
while k >= 1
  n     = ns(k);
  fr(k) = (n+2)*fr(k+par)/2;

  gr(k) = fr(k)*2.^(-n);

  fe(k) = 2/( n * gamma(n/2) );
  fo(k) = sqrt(pi)/gamma(n/2 + 1);

  ge(k) = fe(k)*2.^(-n);
  go(k) = fo(k)*2.^(-n);
  k     = k - 1;
end

% length(fr) = 16001 for par = 2000;
%xlswrite(filename,A,range)
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',ns', 'ns');
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',fs', 'fs');
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',fr', 'fr');
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',fe', 'fe');
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',fo', 'fo');
%xlswrite('D:\Szymon\Pulpit\_____MFA_MSA\wywalmnie.xls',Vkrs', 'Vkrs');
n  = -7:9;

%test
figure
hold on
plot(n , f      );
plot(ns, fs, 'r'); % spline
plot(ns, fr, 'c'); % recurrence
plot(ns, pf, 'g'); % pi factor
plot(ns, fe, 'y'); % even f
plot(ns, fo, 'k'); % odd f
grid on
axis([-7 9 -2 2.5])

return



figure
hold on
plot(n (1:length(n)-2),      f (1:length(n)-2)          );
plot(ns(1:length(ns)-par-1), fs(1:length(ns)-par-1), 'r'); % spline
plot(ns(1:length(ns)-par-1), fr(1:length(ns)-par-1), 'c'); % recurrence
plot(ns(1:length(ns)-par-1), pf(1:length(ns)-par-1), 'g'); % pi factor
plot(ns(1:length(ns)-par-1), fe(1:length(ns)-par-1), 'y'); % even f
plot(ns(1:length(ns)-par-1), fo(1:length(ns)-par-1), 'k'); % odd f
grid on
axis([-7 7 min(f) 2.5])

%valid for par=2000 only ns(3001):ns(11001)
%valid for par=20 only ns(31):ns(111)

figure
hold on
plot( n(4:12), g(4:12) );
plot(ns(1.5*par+1:length(ns)-2.5*par), gs(1.5*par+1:length(ns)-2.5*par), 'r'); % spline
plot(ns(1.5*par+1:length(ns)-2.5*par), gr(1.5*par+1:length(ns)-2.5*par), 'c'); % recurrence
plot(ns(1.5*par+1:length(ns)-2.5*par), pf(1.5*par+1:length(ns)-2.5*par), 'g'); % pi factor
plot(ns(1.5*par+1:length(ns)-2.5*par), ge(1.5*par+1:length(ns)-2.5*par), 'y'); % even f
plot(ns(1.5*par+1:length(ns)-2.5*par), go(1.5*par+1:length(ns)-2.5*par), 'k'); % odd f
grid on
axis([-4 4 -4.5 2.5])

%return
