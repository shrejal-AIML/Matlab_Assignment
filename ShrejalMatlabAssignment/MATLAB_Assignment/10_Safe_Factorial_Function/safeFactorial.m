function [fact, ok] = safeFactorial(n)
% Computes factorial for non-negative integers using a loop
% Returns ok=false and fact=NaN for invalid input

fact = NaN;
ok = false;

% reject anything that is not a non-negative integer
if ~isscalar(n) || n < 0 || n ~= fix(n)
    return;
end

ok = true;
fact = 1;
for i = 2:n
    fact = fact * i;
end
end
