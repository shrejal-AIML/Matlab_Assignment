% Marks Analysis Function + File Output
% Uses analyzeMarks to validate and compute stats, writes report to result.txt
clc; clear;

scores = [78 85 -10 42 68 115 51 33 90 105 44];

[avg, top, nPass, nFail, good, bad] = analyzeMarks(scores);

fid = fopen('result.txt', 'w');
if fid == -1
    error('Cannot create result.txt');
end
fprintf(fid, '---- Marks Analysis ----\n');
fprintf(fid, 'All marks       : '); fprintf(fid, '%g ', scores);
fprintf(fid, '\nValid marks     : '); fprintf(fid, '%g ', good);
fprintf(fid, '\nInvalid (dropped): '); fprintf(fid, '%g ', bad);
fprintf(fid, '\nValid count     : %d\n', length(good));
fprintf(fid, 'Average         : %.2f\n', avg);
fprintf(fid, 'Highest         : %g\n', top);
fprintf(fid, 'Passed (>=40)   : %d\n', nPass);
fprintf(fid, 'Failed          : %d\n', nFail);
fclose(fid);

type('result.txt');
