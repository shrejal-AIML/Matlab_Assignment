% Mini Transaction Summary
% Reads transaction amounts from file
% Positive = credit, negative = debit, zero = no change
clc; clear;

fIn = fopen('transactions.txt', 'r');
if fIn == -1
    disp('Error: transactions.txt not found.');
    return;
end
amounts = fscanf(fIn, '%f');
fclose(fIn);

totCr = 0; totDb = 0;
nCr = 0; nDb = 0; nNone = 0;
bigCr = 0; bigDb = 0;

for k = 1:length(amounts)
    a = amounts(k);
    if a > 0
        totCr = totCr + a;
        nCr = nCr + 1;
        if a > bigCr
            bigCr = a;
        end
    elseif a < 0
        totDb = totDb + abs(a);
        nDb = nDb + 1;
        if abs(a) > bigDb
            bigDb = abs(a);
        end
    else
        nNone = nNone + 1;
    end
end
balance = totCr - totDb;

fOut = fopen('output.txt', 'w');
if fOut == -1
    error('Cannot create output.txt');
end
fprintf(fOut, '---- Transaction Summary ----\n');
fprintf(fOut, 'Total transactions   : %d\n', length(amounts));
fprintf(fOut, '%s\n', repmat('-', 1, 36));
fprintf(fOut, 'No.  Amount       Type\n');
for k = 1:length(amounts)
    if amounts(k) > 0
        tp = 'Credit';
    elseif amounts(k) < 0
        tp = 'Debit';
    else
        tp = 'No change';
    end
    fprintf(fOut, '%-4d %9.2f   %s\n', k, amounts(k), tp);
end
fprintf(fOut, '%s\n', repmat('-', 1, 36));
fprintf(fOut, 'Total credits        : %.2f\n', totCr);
fprintf(fOut, 'Total debits         : %.2f\n', totDb);
fprintf(fOut, 'Net balance          : %.2f\n', balance);
fprintf(fOut, 'Credit transactions  : %d\n', nCr);
fprintf(fOut, 'Debit transactions   : %d\n', nDb);
fprintf(fOut, 'No-change entries    : %d\n', nNone);
fprintf(fOut, 'Largest credit       : %.2f\n', bigCr);
fprintf(fOut, 'Largest debit amount : %.2f\n', bigDb);
fclose(fOut);

type('output.txt');
