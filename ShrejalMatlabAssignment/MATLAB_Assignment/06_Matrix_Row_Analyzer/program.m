% Row-wise Matrix Analyzer
% Computes sum, average, max per row using loops
% Identifies the row with the greatest sum
clc; clear;

mat = [ 8  3 14  6;
       11 17  5  9;
        4 10 12  7;
       13  2 16  1];

[rows, cols] = size(mat);
rSum = zeros(1, rows);
rAvg = zeros(1, rows);
rMax = zeros(1, rows);

for r = 1:rows
    s = 0;
    mx = mat(r, 1);
    for c = 1:cols
        s = s + mat(r, c);
        if mat(r, c) > mx
            mx = mat(r, c);
        end
    end
    rSum(r) = s;
    rAvg(r) = s / cols;
    rMax(r) = mx;
end

% find row with highest sum
topRow = 1;
for r = 2:rows
    if rSum(r) > rSum(topRow)
        topRow = r;
    end
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Row-wise Matrix Analysis ----\nMatrix:\n');
for r = 1:rows
    fprintf(fid, '%6g', mat(r, :)); fprintf(fid, '\n');
end
fprintf(fid, '\n%-5s %7s %9s %7s\n', 'Row', 'Sum', 'Average', 'Max');
for r = 1:rows
    fprintf(fid, '%-5d %7g %9.2f %7g\n', r, rSum(r), rAvg(r), rMax(r));
end
fprintf(fid, '\nHighest row sum: Row %d (sum = %g)\n', topRow, rSum(topRow));
fclose(fid);

type('output.txt');
