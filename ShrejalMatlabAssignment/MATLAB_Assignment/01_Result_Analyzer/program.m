% Student Result Analyzer
% Accepts marks vector, filters valid entries (0-100), computes statistics
% and classifies each mark as Pass or Fail
clc; clear;

studentMarks = [72 45 -5 88 63 110 37 91 54 102 29 76];
cutoff = 40;  % minimum marks to pass

% Separate valid and invalid marks
goodMarks = [];
badMarks = [];
for k = 1:length(studentMarks)
    if studentMarks(k) >= 0 && studentMarks(k) <= 100
        goodMarks(end+1) = studentMarks(k);
    else
        badMarks(end+1) = studentMarks(k);
    end
end

sumMarks = 0; avg = 0; hi = 0; lo = 0;
passed = 0; failed = 0;

if ~isempty(goodMarks)
    hi = goodMarks(1);
    lo = goodMarks(1);
    for k = 1:length(goodMarks)
        sumMarks = sumMarks + goodMarks(k);
        if goodMarks(k) > hi
            hi = goodMarks(k);
        end
        if goodMarks(k) < lo
            lo = goodMarks(k);
        end
        % classify as pass or fail
        if goodMarks(k) >= cutoff
            passed = passed + 1;
        else
            failed = failed + 1;
        end
    end
    avg = sumMarks / length(goodMarks);
end

% write results to file
fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot open output.txt for writing');
end
fprintf(fid, '---- Student Result Analyzer ----\n');
fprintf(fid, 'Input marks  : '); fprintf(fid, '%g ', studentMarks);
fprintf(fid, '\nValid marks  : '); fprintf(fid, '%g ', goodMarks);
fprintf(fid, '\nRejected     : '); fprintf(fid, '%g ', badMarks);
fprintf(fid, '\nPass cutoff  : mark >= %d\n', cutoff);
if isempty(goodMarks)
    fprintf(fid, 'No valid marks were found.\n');
else
    fprintf(fid, 'Total        : %g\n', sumMarks);
    fprintf(fid, 'Average      : %.2f\n', avg);
    fprintf(fid, 'Highest      : %g\n', hi);
    fprintf(fid, 'Lowest       : %g\n', lo);
    fprintf(fid, 'Passed       : %d\n', passed);
    fprintf(fid, 'Failed       : %d\n', failed);
end
fclose(fid);

type('output.txt');
