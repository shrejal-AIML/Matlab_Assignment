% Read and Analyze Numbers from File
% Reads numeric values from input.txt, classifies and computes statistics
% Checks whether the input file opened successfully
clc; clear;

fIn = fopen('input.txt', 'r');
if fIn == -1
    fOut = fopen('output.txt', 'w');
    fprintf(fOut, 'Error: could not open input.txt.\n');
    fclose(fOut);
    disp('Error: could not open input.txt.');
    return;
end
nums = fscanf(fIn, '%f');
fclose(fIn);

if isempty(nums)
    disp('input.txt has no numeric data.');
    return;
end

% classify and compute in one pass
posVals = []; negVals = []; nZeros = 0;
sm = 0; lo = nums(1); hi = nums(1);
for k = 1:length(nums)
    v = nums(k);
    sm = sm + v;
    if v > 0
        posVals(end+1) = v;
    elseif v < 0
        negVals(end+1) = v;
    else
        nZeros = nZeros + 1;
    end
    if v < lo
        lo = v;
    end
    if v > hi
        hi = v;
    end
end
avg = sm / length(nums);

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Cannot create output.txt');
end
fprintf(fOut, '---- Number File Analysis ----\n');
fprintf(fOut, 'Values read    : '); fprintf(fOut, '%g ', nums);
fprintf(fOut, '\nTotal values   : %d\n', length(nums));
fprintf(fOut, 'Positive (%d)   : ', length(posVals)); fprintf(fOut, '%g ', posVals);
fprintf(fOut, '\nNegative (%d)   : ', length(negVals)); fprintf(fOut, '%g ', negVals);
fprintf(fOut, '\nZeros          : %d\n', nZeros);
fprintf(fOut, 'Sum            : %g\n', sm);
fprintf(fOut, 'Average        : %.2f\n', avg);
fprintf(fOut, 'Minimum        : %g\n', lo);
fprintf(fOut, 'Maximum        : %g\n', hi);
fclose(fOut);

type('output.txt');
