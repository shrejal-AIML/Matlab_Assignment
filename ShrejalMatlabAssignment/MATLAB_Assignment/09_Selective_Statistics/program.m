% Selective Processing with continue
% Skips non-positive values using continue
% Computes count, sum and average of positive values only
clc; clear;

sets = {[5 -7 0 18 -2 9 0 11 -4 3], ...
        [-6 0 -12 -1 0]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Selective Statistics (positive values) ----\n');

for d = 1:length(sets)
    arr = sets{d};
    ct = 0; sm = 0;
    for k = 1:length(arr)
        if arr(k) <= 0
            continue;  % skip zeros and negatives
        end
        ct = ct + 1;
        sm = sm + arr(k);
    end

    fprintf(fid, '\nDataset %d: ', d); fprintf(fid, '%g ', arr);
    fprintf(fid, '\nPositive count : %d\n', ct);
    if ct > 0
        fprintf(fid, 'Positive sum   : %g\n', sm);
        fprintf(fid, 'Positive avg   : %.2f\n', sm / ct);
    else
        fprintf(fid, 'No positive values found. Sum and average cannot be computed.\n');
    end
end
fclose(fid);

type('output.txt');
