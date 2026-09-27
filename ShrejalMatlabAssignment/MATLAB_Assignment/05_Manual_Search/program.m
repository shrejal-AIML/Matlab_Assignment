% Search with First Position and Occurrence Count
% Uses loop+break for first position, separate loop for counting
% MATLAB uses 1-based indexing
clc; clear;

vec = [11 8 34 6 34 19 34 3 6];
searchVals = [34 55];  % one exists, one does not

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Search Report ----\n');
fprintf(fid, 'Array: '); fprintf(fid, '%g ', vec); fprintf(fid, '\n');

for t = 1:length(searchVals)
    target = searchVals(t);

    % locate first occurrence using break
    pos = -1;
    for k = 1:length(vec)
        if vec(k) == target
            pos = k;
            break;
        end
    end

    % count how many times the value appears
    totalOccur = 0;
    if pos ~= -1
        for k = pos:length(vec)
            if vec(k) == target
                totalOccur = totalOccur + 1;
            end
        end
    end

    fprintf(fid, '\nSearching for : %g\n', target);
    if pos == -1
        fprintf(fid, 'Result        : %g was not found in the array.\n', target);
    else
        fprintf(fid, 'First position: %d\n', pos);
        fprintf(fid, 'Occurrences   : %d\n', totalOccur);
    end
end
fclose(fid);

type('output.txt');
