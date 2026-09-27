% File-based Student Result System
%
% INPUT FORMAT of marks.txt:
%   Each row represents one student: RollNo Sub1 Sub2 Sub3 Sub4
%   All subjects are out of 100, separated by spaces
%
% A student passes only when every subject mark is >= 40
clc; clear;

nSub = 4;
passLine = 40;

fIn = fopen('marks.txt', 'r');
if fIn == -1
    disp('Error: marks.txt not found.');
    return;
end
rawData = fscanf(fIn, '%f', [nSub + 1, Inf])';
fclose(fIn);

fOut = fopen('result.txt', 'w');
if fOut == -1
    error('Cannot create result.txt');
end
fprintf(fOut, '---- Student Result Report ----\n');
fprintf(fOut, 'Pass condition: all subjects >= %d\n\n', passLine);
fprintf(fOut, '%-6s %5s %5s %5s %5s %7s %8s  %s\n', 'Roll', 'S1', 'S2', 'S3', 'S4', 'Total', 'Avg', 'Result');
fprintf(fOut, '%s\n', repmat('-', 1, 56));

nPass = 0; nFail = 0;
for i = 1:size(rawData, 1)
    roll = rawData(i, 1);
    sm = 0;
    anyFail = false;
    for j = 2:nSub + 1
        sm = sm + rawData(i, j);
        if rawData(i, j) < passLine
            anyFail = true;
        end
    end
    av = sm / nSub;

    if anyFail
        res = 'Fail';
        nFail = nFail + 1;
    else
        res = 'Pass';
        nPass = nPass + 1;
    end
    fprintf(fOut, '%-6d %5g %5g %5g %5g %7g %8.2f  %s\n', roll, rawData(i, 2:end), sm, av, res);
end

fprintf(fOut, '\nTotal students: %d   Pass: %d   Fail: %d\n', size(rawData, 1), nPass, nFail);
fclose(fOut);

type('result.txt');
