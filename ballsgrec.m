function a = ballsgrec(n)
% Recursion through A087299
if n<2
  a = 1;
else
  a = 2*n*ballsgrec(n-2);
end
