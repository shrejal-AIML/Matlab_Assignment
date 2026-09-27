% Persistent Attendance Log
% Appends records to attendance.txt (mode 'a') without erasing old data
% Validates status input: only P (Present), A (Absent), L (Leave) accepted
clc; clear;

validCodes = {'P', 'A', 'L'};
fullStatus = {'Present', 'Absent', 'Leave'};

n = input('Number of records to add: ');

fid = fopen('attendance.txt', 'a');
if fid == -1
    error('Cannot open attendance.txt');
end

count = 0;
for r = 1:n
    sName = strtrim(input(sprintf('Record %d - Name: ', r), 's'));
    if isempty(sName)
        fprintf('Name is empty, skipping this record.\n');
        continue;
    end

    sCode = upper(strtrim(input('Status (P/A/L): ', 's')));

    % validate the entered status
    match = 0;
    for j = 1:length(validCodes)
        if strcmp(sCode, validCodes{j})
            match = j;
            break;
        end
    end

    if match == 0
        fprintf('Invalid status ''%s'' for %s. Record not saved.\n', sCode, sName);
    else
        fprintf(fid, '%-14s | %s\n', sName, fullStatus{match});
        count = count + 1;
        fprintf('Added: %s - %s\n', sName, fullStatus{match});
    end
end
fclose(fid);

fprintf('\n%d record(s) appended. Contents of attendance.txt:\n', count);
type('attendance.txt');
