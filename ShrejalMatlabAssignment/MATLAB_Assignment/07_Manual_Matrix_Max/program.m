% Manual Matrix Maximum with Position
% Uses nested loops to find max element and its location
% Initialises from first element so negative-only matrices work correctly
clc; clear;

testMatrices = {[7 22 -1; 15 3 28; -6 19 10], ...
                [-11 -4 -18; -2 -25 -7; -14 -30 -9]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Manual Matrix Maximum ----\n');

for idx = 1:length(testMatrices)
    A = testMatrices{idx};
    peakVal = A(1, 1); peakR = 1; peakC = 1;
    for r = 1:size(A, 1)
        for c = 1:size(A, 2)
            if A(r, c) > peakVal
                peakVal = A(r, c);
                peakR = r;
                peakC = c;
            end
        end
    end

    fprintf(fid, '\nTest matrix %d:\n', idx);
    for r = 1:size(A, 1)
        fprintf(fid, '%6g', A(r, :)); fprintf(fid, '\n');
    end
    fprintf(fid, 'Max value  : %g\n', peakVal);
    fprintf(fid, 'Location   : Row %d, Column %d\n', peakR, peakC);
end
fclose(fid);

type('output.txt');
