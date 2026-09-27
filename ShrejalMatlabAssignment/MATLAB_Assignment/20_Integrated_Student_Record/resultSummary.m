function res = resultSummary(marks, passLine)
% Validates marks and returns a struct with computed statistics
% Fields: valid, invalid, total, average, highest, lowest,
%         passCount, failCount, passPercent, overall

if nargin < 2
    passLine = 40;
end

res.valid = []; res.invalid = [];
for k = 1:length(marks)
    m = marks(k);
    if isfinite(m) && m >= 0 && m <= 100
        res.valid(end+1) = m;
    else
        res.invalid(end+1) = m;
    end
end

res.total = 0; res.average = 0; res.highest = 0; res.lowest = 0;
res.passCount = 0; res.failCount = 0; res.passPercent = 0;

if isempty(res.valid)
    res.overall = 'No valid marks available';
    return;
end

res.highest = res.valid(1);
res.lowest = res.valid(1);
for k = 1:length(res.valid)
    m = res.valid(k);
    res.total = res.total + m;
    if m > res.highest
        res.highest = m;
    end
    if m < res.lowest
        res.lowest = m;
    end
    if m >= passLine
        res.passCount = res.passCount + 1;
    else
        res.failCount = res.failCount + 1;
    end
end
res.average = res.total / length(res.valid);
res.passPercent = 100 * res.passCount / length(res.valid);

% overall class result based on pass percentage
if res.passPercent >= 75
    res.overall = 'Good (75%+ passed)';
elseif res.passPercent >= 50
    res.overall = 'Average (50-75% passed)';
else
    res.overall = 'Poor (below 50% passed)';
end
end
