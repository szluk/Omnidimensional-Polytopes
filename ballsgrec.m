function a = ballsgrec(n)
% Recursion through A087299
%% (c) Szymon £ukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1:0 21.05.2022

if n<2
  a = 1;
else
  a = 2*n*ballsgrec(n-2);
end
