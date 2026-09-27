% Second Largest Distinct Value (no sort used)
% Handles duplicate max values and reports when no second distinct exists
clc; clear;

inputArr = [45 82 19 82 63 45 97 97 31 63];

% step 1 - determine the maximum value
maxVal = inputArr(1);
for k = 2:length(inputArr)
    if inputArr(k) > maxVal
        maxVal = inputArr(k);
    end
end

% step 2 - find the biggest value strictly below the maximum
secondFound = false;
secondVal = 0;
for k = 1:length(inputArr)
    if inputArr(k) < maxVal
        if ~secondFound || inputArr(k) > secondVal
            secondVal = inputArr(k);
            secondFound = true;
        end
    end
end

% write result to file
fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot open output.txt');
end
fprintf(fid, '---- Second Largest Distinct Value ----\n');
fprintf(fid, 'Input array       : '); fprintf(fid, '%g ', inputArr);
fprintf(fid, '\nMaximum value     : %g\n', maxVal);
if secondFound
    fprintf(fid, 'Second largest    : %g\n', secondVal);
else
    fprintf(fid, 'Second distinct value does not exist (all elements are the same).\n');
end
fclose(fid);

type('output.txt');
