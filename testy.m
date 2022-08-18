%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 18.08.2022

clear all

n=-4:6;
dlt = .001;
ns=min(n):dlt:max(n);

%Vs  = sqrt(1+ns) .* ( 2.^(-ns/2) ) ./ gamma2(1+ns); % simplex

Vs  = ( 2.^(ns/2) ) ./ gamma2(1+ns);  % orthoplex

%Vs  = ( pi.^(ns/2) ) ./ gamma2(1+(ns/2));  % ball

figure
hold on
plot(ns, Vs, 'g')
axis([min(n) max(n) -.5 1.5])
grid on