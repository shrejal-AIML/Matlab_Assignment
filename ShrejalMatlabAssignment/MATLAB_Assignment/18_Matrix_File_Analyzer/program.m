% Matrix File Analyzer
% Reads a matrix from matrix.txt, finds overall max/min with positions
% using nested loops, computes row sums, and identifies highest-sum row
clc; clear;

fIn = fopen('matrix.txt', 'r');
if fIn == -1
    disp('Error: matrix.txt not found.');
    return;
end

% read line by line to handle any matrix size
M = [];
ln = fgetl(fIn);
while ischar(ln)
    rv = sscanf(ln, '%f')';
    if ~isempty(rv)
        M(end+1, :) = rv;
    end
    ln = fgetl(fIn);
end
fclose(fIn);

[nr, nc] = size(M);

% nested loop for max, min, and row sums
gMax = M(1,1); gMaxR = 1; gMaxC = 1;
gMin = M(1,1); gMinR = 1; gMinC = 1;
rSum = zeros(1, nr);
for i = 1:nr
    for j = 1:nc
        rSum(i) = rSum(i) + M(i, j);
        if M(i, j) > gMax
            gMax = M(i, j); gMaxR = i; gMaxC = j;
        end
        if M(i, j) < gMin
            gMin = M(i, j); gMinR = i; gMinC = j;
        end
    end
end

topRow = 1;
for i = 2:nr
    if rSum(i) > rSum(topRow)
        topRow = i;
    end
end

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Cannot create output.txt');
end
fprintf(fOut, '---- Matrix File Analysis ----\n');
fprintf(fOut, 'Matrix from matrix.txt (%dx%d):\n', nr, nc);
for i = 1:nr
    fprintf(fOut, '%6g', M(i, :)); fprintf(fOut, '\n');
end
fprintf(fOut, '\nMax value: %g at Row %d, Col %d\n', gMax, gMaxR, gMaxC);
fprintf(fOut, 'Min value: %g at Row %d, Col %d\n\n', gMin, gMinR, gMinC);
for i = 1:nr
    fprintf(fOut, 'Row %d sum: %g\n', i, rSum(i));
end
fprintf(fOut, '\nHighest sum row: Row %d (sum = %g)\n', topRow, rSum(topRow));
fclose(fOut);

type('output.txt');
