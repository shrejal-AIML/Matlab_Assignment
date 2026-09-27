function [pos, neg, zer, ev, od] = classifyArray(arr)
% Counts positive, negative, zero, even and odd elements
% Even/odd classification applies only to integer values

pos = 0; neg = 0; zer = 0; ev = 0; od = 0;
for k = 1:length(arr)
    v = arr(k);
    if v > 0
        pos = pos + 1;
    elseif v < 0
        neg = neg + 1;
    else
        zer = zer + 1;
    end
    if v == fix(v)
        if mod(v, 2) == 0
            ev = ev + 1;
        else
            od = od + 1;
        end
    end
end
end
