clear all

n=-9:7;
for k=1:length(n)
  [num den frac] = ballsfg(n(k));
  f(k) = frac;
  g(k) = frac*2.^(-n(k));
end

ns = -9:.001:7;
pf = pi.^floor(ns/2);

fs = spline(n, f,  ns);
gs = spline(n, g,  ns);

% fs_1  = fs(-9)
% fs_21 = fs(-7)

par = 2000;

for k=1:par
  fr(k) = fs(k);
  gr(k) = gs(k);  

  n=ns(k);
  fe(k) = 2/( n * gamma(n/2) );
  fo(k) = sqrt(pi)/gamma(n/2 + 1);
  
  ge(k) = fe(k)*2^(-n);
  go(k) = fo(k)*2^(-n);
end

for k=par+1:length(fs)
  fr(k) = 2*fr(k-par)/ns(k);
  gr(k) = fr(k)*2.^(-n);

  n=ns(k);
  fe(k) = 2/( n * gamma(n/2) );
  fo(k) = sqrt(pi)/gamma(n/2 + 1);

  ge(k) = fe(k)*2.^(-n);
  go(k) = fo(k)*2.^(-n);
end

n  = -9:7;

figure
hold on
plot(n(3:length(n)), f(3:length(n)));
plot(ns(par+1:length(ns)), fs(par+1:length(ns)), 'r'); % spline
plot(ns(par+1:length(ns)), fr(par+1:length(ns)), 'c'); % recurrence
plot(ns(par+1:length(ns)), pf(par+1:length(ns)), 'g'); % pi factor
plot(ns(par+1:length(ns)), fe(par+1:length(ns)), 'y'); % even f
plot(ns(par+1:length(ns)), fo(par+1:length(ns)), 'k'); % odd f
grid on
axis([-7 7 min(f) 2.5])

figure
hold on
plot( n(6:14), g(6:14) );
plot(ns(2.5*par+1:length(ns)-1.5*par), gs(2.5*par+1:length(ns)-1.5*par), 'r'); % spline
plot(ns(2.5*par+1:length(ns)-1.5*par), gr(2.5*par+1:length(ns)-1.5*par), 'c'); % recurrence
plot(ns(2.5*par+1:length(ns)-1.5*par), pf(2.5*par+1:length(ns)-1.5*par), 'g'); % pi factor
plot(ns(2.5*par+1:length(ns)-1.5*par), ge(2.5*par+1:length(ns)-1.5*par), 'y'); % even f
plot(ns(2.5*par+1:length(ns)-1.5*par), go(2.5*par+1:length(ns)-1.5*par), 'k'); % odd f
grid on
axis([-4 4 -4.5 2.5])
return
