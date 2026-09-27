% Multi-output Array Summary Function
% Tests arraySummary with positive, all-negative, and mixed arrays
clc; clear;

testArrays = {[21 8 35 14 6], ...
              [-7 -18 -3 -25 -11], ...
              [9 -5 0 12 -8 4]};
names = {'Positive only', 'All-negative', 'Mixed values'};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Array Summary Report ----\n');

for k = 1:length(testArrays)
    [tot, avg, mn, mx] = arraySummary(testArrays{k});
    fprintf(fid, '\n%s: ', names{k}); fprintf(fid, '%g ', testArrays{k});
    fprintf(fid, '\n  Total   = %g\n  Average = %.2f\n  Min     = %g\n  Max     = %g\n', ...
            tot, avg, mn, mx);
end
fclose(fid);

type('output.txt');
