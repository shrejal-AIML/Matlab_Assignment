function [tot, avg, mn, mx] = arraySummary(arr)
% Returns total, average, min and max of the input array
% Min and max are determined manually using a loop

tot = 0; avg = 0; mn = NaN; mx = NaN;
if isempty(arr)
    return;
end

mn = arr(1);
mx = arr(1);
for k = 1:length(arr)
    tot = tot + arr(k);
    if arr(k) < mn
        mn = arr(k);
    end
    if arr(k) > mx
        mx = arr(k);
    end
end
avg = tot / length(arr);
end
