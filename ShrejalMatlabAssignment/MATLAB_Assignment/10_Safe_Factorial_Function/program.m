% Validated Factorial Function - test driver
% Calls safeFactorial with valid, invalid, and edge cases
clc; clear;

inputs = [5 0 7 -3 2.8];

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Factorial Test Results ----\n');

for k = 1:length(inputs)
    val = inputs(k);
    [fact, ok] = safeFactorial(val);
    if ok
        fprintf(fid, 'Case %d: %g! = %g\n', k, val, fact);
    else
        fprintf(fid, 'Case %d: %g -> Rejected (not a non-negative integer)\n', k, val);
    end
end
fclose(fid);

type('output.txt');
