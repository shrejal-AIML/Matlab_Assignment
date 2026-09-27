function [avg, top, nPass, nFail, good, bad] = analyzeMarks(scores)
% Validates marks (0-100), computes average and highest valid mark,
% counts pass/fail (pass >= 40). Invalid marks are excluded.

threshold = 40;
good = [];
bad = [];
for k = 1:length(scores)
    if scores(k) >= 0 && scores(k) <= 100
        good(end+1) = scores(k);
    else
        bad(end+1) = scores(k);
    end
end

avg = 0; top = 0; nPass = 0; nFail = 0;
if isempty(good)
    return;
end

total = 0;
top = good(1);
for k = 1:length(good)
    total = total + good(k);
    if good(k) > top
        top = good(k);
    end
    if good(k) >= threshold
        nPass = nPass + 1;
    else
        nFail = nFail + 1;
    end
end
avg = total / length(good);
end
