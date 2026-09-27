% Integrated Student Record Processor (Capstone)
% Reads marks from student_marks.txt, validates, calls resultSummary,
% and writes a complete report to final_report.txt
clc; clear;

srcFile = 'student_marks.txt';
rptFile = 'final_report.txt';
passLine = 40;

% open input file safely
fIn = fopen(srcFile, 'r');
if fIn == -1
    fOut = fopen(rptFile, 'w');
    if fOut ~= -1
        fprintf(fOut, 'Error: %s could not be opened. Report not generated.\n', srcFile);
        fclose(fOut);
    end
    fprintf('Error: %s could not be opened.\n', srcFile);
    return;
end
marks = fscanf(fIn, '%f');
fclose(fIn);

% call the user-defined function for analysis
res = resultSummary(marks, passLine);

% write the full report
fOut = fopen(rptFile, 'w');
if fOut == -1
    error('Cannot create %s', rptFile);
end
fprintf(fOut, '==========================================\n');
fprintf(fOut, '     STUDENT RECORD - FINAL REPORT\n');
fprintf(fOut, '==========================================\n');
fprintf(fOut, 'Source file      : %s\n', srcFile);
fprintf(fOut, 'Marks read       : %d\n', length(marks));
fprintf(fOut, 'Valid marks (%d)  : ', length(res.valid)); fprintf(fOut, '%g ', res.valid);
fprintf(fOut, '\nInvalid marks (%d): ', length(res.invalid)); fprintf(fOut, '%g ', res.invalid);
fprintf(fOut, '\n(Range 0-100 is valid; invalid marks are excluded.)\n\n');

fprintf(fOut, 'Individual status:\n');
for k = 1:length(res.valid)
    if res.valid(k) >= passLine
        tag = 'Pass';
    else
        tag = 'Fail';
    end
    fprintf(fOut, '  Student %2d : %5g  %s\n', k, res.valid(k), tag);
end

fprintf(fOut, '\n------------ Summary ------------\n');
fprintf(fOut, 'Total         : %g\n', res.total);
fprintf(fOut, 'Average       : %.2f\n', res.average);
fprintf(fOut, 'Highest       : %g\n', res.highest);
fprintf(fOut, 'Lowest        : %g\n', res.lowest);
fprintf(fOut, 'Pass count    : %d (cutoff %d)\n', res.passCount, passLine);
fprintf(fOut, 'Fail count    : %d\n', res.failCount);
fprintf(fOut, 'Pass %%        : %.2f%%\n', res.passPercent);
fprintf(fOut, 'Overall       : %s\n', res.overall);
fclose(fOut);

type(rptFile);
