% Array Classification and Summary
% Classifies values as positive/negative/zero, even/odd for integers,
% computes sums and finds dominant category
clc; clear;

data = [11 -9 0 7 -14 2.5 0 18 -3 6 -1 21];

posCount = 0; negCount = 0; zCount = 0;
evCount = 0; odCount = 0; fracCount = 0;
posSum = 0; negSum = 0;

for k = 1:length(data)
    val = data(k);
    % sign-based classification
    if val > 0
        posCount = posCount + 1;
        posSum = posSum + val;
    elseif val < 0
        negCount = negCount + 1;
        negSum = negSum + val;
    else
        zCount = zCount + 1;
    end
    % even/odd only for integers
    if val == fix(val)
        if mod(val, 2) == 0
            evCount = evCount + 1;
        else
            odCount = odCount + 1;
        end
    else
        fracCount = fracCount + 1;
    end
end

% find which sign category has the most elements
catLabels = {'Positive', 'Negative', 'Zero'};
catValues = [posCount negCount zCount];
topIdx = 1;
for k = 2:3
    if catValues(k) > catValues(topIdx)
        topIdx = k;
    end
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Array Classification ----\n');
fprintf(fid, 'Array             : '); fprintf(fid, '%g ', data);
fprintf(fid, '\nPositive count    : %d\n', posCount);
fprintf(fid, 'Negative count    : %d\n', negCount);
fprintf(fid, 'Zero count        : %d\n', zCount);
fprintf(fid, 'Even integers     : %d\n', evCount);
fprintf(fid, 'Odd integers      : %d\n', odCount);
fprintf(fid, 'Non-integers      : %d (excluded from even/odd)\n', fracCount);
fprintf(fid, 'Sum of positives  : %g\n', posSum);
fprintf(fid, 'Sum of negatives  : %g\n', negSum);
fprintf(fid, 'Dominant category : %s (%d elements)\n', catLabels{topIdx}, catValues(topIdx));
fclose(fid);

type('output.txt');
