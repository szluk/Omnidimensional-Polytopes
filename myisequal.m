function tf = myisequal(A, B, sgn)
% Test arrays for equality with given significance and on average
% INPUT:
% A   - first array
% B   - second array
% sgn - significance, default sgn = 1.0e-10
% OUTPUT:
% tf  - true (A is equal to B), false (A is not equal to B)
% (c) Szymon Lukaszyk
% licensed under MIT License
% email: szymon@patent.pl
% History
% v1: 25.10.2022
% v2: 21.02.2023 (clean up)

if nargin < 2
  error 'Wrong number of arguments in myisequal.';
end
if nargin == 2
  sgn = 1.0e-10;
end

avg = 0;
for k=1:length(A)
  avg = avg + abs(A(k)-B(k));
end
avg = avg/length(A);

if avg < sgn
  tf = true;
else
  tf = false;
end