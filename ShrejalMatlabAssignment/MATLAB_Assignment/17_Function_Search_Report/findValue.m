function [idx, cnt] = findValue(arr, target)
% Returns the first 1-based index of target and total occurrences
% idx = -1 when target is not found

idx = -1;
cnt = 0;
for k = 1:length(arr)
    if arr(k) == target
        cnt = cnt + 1;
        if idx == -1
            idx = k;
        end
    end
end
end
