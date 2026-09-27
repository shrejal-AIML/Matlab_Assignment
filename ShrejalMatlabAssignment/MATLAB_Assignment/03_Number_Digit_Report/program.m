% Number Digit Analysis using while loop
% Extracts digits with mod/floor, counts even and odd digits,
% reverses the number and checks for palindrome
clc; clear;

n = 73537;

% input must be a positive integer
if n <= 0 || n ~= fix(n)
    error('Input must be a positive integer.');
end

origNum = n;
numDigits = 0; totalDigitSum = 0;
countEven = 0; countOdd = 0;
rev = 0;

while n > 0
    d = mod(n, 10);
    numDigits = numDigits + 1;
    totalDigitSum = totalDigitSum + d;
    if mod(d, 2) == 0
        countEven = countEven + 1;
    else
        countOdd = countOdd + 1;
    end
    rev = rev * 10 + d;
    n = floor(n / 10);
end

if rev == origNum
    isPalin = 'Yes';
else
    isPalin = 'No';
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Digit Analysis Report ----\n');
fprintf(fid, 'Original number  : %d\n', origNum);
fprintf(fid, 'Digit count      : %d\n', numDigits);
fprintf(fid, 'Digit sum        : %d\n', totalDigitSum);
fprintf(fid, 'Even digits      : %d\n', countEven);
fprintf(fid, 'Odd digits       : %d\n', countOdd);
fprintf(fid, 'Reversed number  : %d\n', rev);
fprintf(fid, 'Is palindrome    : %s\n', isPalin);
fclose(fid);

type('output.txt');
