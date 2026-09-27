% Function-based Search + Report File
% Reads array from numbers.txt, searches for targets using findValue,
% and saves the search report to output.txt
clc; clear;

fIn = fopen('numbers.txt', 'r');
if fIn == -1
    disp('Error: numbers.txt not found.');
    return;
end
arr = fscanf(fIn, '%f')';
fclose(fIn);

targets = [7 24 60];  % repeated, single occurrence, absent

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Cannot create output.txt');
end
fprintf(fOut, '---- Search Report ----\n');
fprintf(fOut, 'Array: '); fprintf(fOut, '%g ', arr);
fprintf(fOut, '\n\n%-8s %-12s %-12s %s\n', 'Target', 'First Pos', 'Count', 'Status');

for t = 1:length(targets)
    [idx, cnt] = findValue(arr, targets(t));
    if idx == -1
        stat = 'Not found';
    else
        stat = 'Found';
    end
    fprintf(fOut, '%-8g %-12d %-12d %s\n', targets(t), idx, cnt, stat);
end
fclose(fOut);

type('output.txt');
