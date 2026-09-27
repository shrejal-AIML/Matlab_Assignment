% Validated Manual Matrix Multiplication
% Verifies dimensions before multiplying, then compares manual product
% with MATLAB's built-in operator
clc; clear;

% test case 1: compatible (2x3 * 3x2), case 2: incompatible (2x3 * 2x2)
matA = {[3 -2 5; 1 4 -1], [3 -2 5; 1 4 -1]};
matB = {[2 7; -1 4; 3 2], [2 3; 4 5]};

fid = fopen('output.txt', 'w');
if fid == -1
    error('Cannot create output.txt');
end
fprintf(fid, '---- Matrix Multiplication ----\n');

for p = 1:length(matA)
    A = matA{p}; B = matB{p};
    [ra, ca] = size(A);
    [rb, cb] = size(B);
    fprintf(fid, '\nTest %d: A is %dx%d, B is %dx%d\n', p, ra, ca, rb, cb);

    % check if multiplication is valid
    if ca ~= rb
        fprintf(fid, 'Cannot multiply: A has %d columns but B has %d rows.\n', ca, rb);
        continue;
    end

    product = zeros(ra, cb);
    for i = 1:ra
        for j = 1:cb
            for k = 1:ca
                product(i, j) = product(i, j) + A(i, k) * B(k, j);
            end
        end
    end

    matlabResult = A * B;
    fprintf(fid, 'Result (%dx%d):\n', ra, cb);
    for i = 1:ra
        fprintf(fid, '%6g', product(i, :)); fprintf(fid, '\n');
    end
    if isequal(product, matlabResult)
        fprintf(fid, 'Matches MATLAB A*B: YES\n');
    else
        fprintf(fid, 'Matches MATLAB A*B: NO\n');
    end
end
fclose(fid);

type('output.txt');
