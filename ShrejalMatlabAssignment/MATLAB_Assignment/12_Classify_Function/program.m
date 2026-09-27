% Reusable Array Classification Function
% Calls classifyArray for two different arrays, prints comparison table
clc; clear;

setA = [5 -12 0 16 -3 9 24 0];
setB = [-18 7 -2 0 8 -26 13 4.5];

[pA, nA, zA, eA, oA] = classifyArray(setA);
[pB, nB, zB, eB, oB] = classifyArray(setB);

labels = {'Positive', 'Negative', 'Zero', 'Even', 'Odd'};
valsA = [pA nA zA eA oA];
valsB = [pB nB zB eB oB];

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Classification Comparison ----\n');
fprintf(fid, 'Set A: '); fprintf(fid, '%g ', setA);
fprintf(fid, '\nSet B: '); fprintf(fid, '%g ', setB);
fprintf(fid, '\n\n%-10s %7s %7s   %s\n', 'Category', 'Set A', 'Set B', 'Note');
fprintf(fid, '%s\n', repmat('-', 1, 42));
for k = 1:length(labels)
    if valsA(k) > valsB(k)
        note = 'A leads';
    elseif valsA(k) < valsB(k)
        note = 'B leads';
    else
        note = 'Tied';
    end
    fprintf(fid, '%-10s %7d %7d   %s\n', labels{k}, valsA(k), valsB(k), note);
end
fclose(fid);

type('output.txt');
