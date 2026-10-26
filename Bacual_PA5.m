% Name: John Matthew P. Bacual
% Section: 2ECE-A
% ECE 2112 - Experiment 5: Introduction to MATLAB Programming

%% Problem A: Transpose Operations
R = [5 -2  0  7;
     1  3 -4  2;
     6  0  8 -1];

Z = [2+3i -1+4i 5-2i;
    -3+1i   6   2+5i];

disp('Problem A: Transpose Operations');

disp('Matrix R:');
disp(R);

disp('transpose(R):');
disp(transpose(R));

disp('R'':');
disp(R');

disp('R.'':');
disp(R.');

disp('Matrix Z:');
disp(Z);

disp('transpose(Z):');
disp(transpose(Z));

disp('Z'':');
disp(Z');

disp('Z.'':');
disp(Z.');

% a. For the real matrix R, transpose(R), R', and R.' give identical results.
% b. For the complex matrix Z, transpose(Z) and Z.' give identical results.
% c. The apostrophe operator (') does more than just switch the rows and columns.
%    When a matrix contains complex numbers, it also reverses the sign of the
%    imaginary part of each entry while leaving the real part unchanged.
%    This is why its result differs from the regular transpose for matrix Z.

%% Problem B: Two Methods for a Linear System
A = [2 -1  3  2;
     1  4 -2  1;
     3  2  1 -1;
    -2  3  4  2];

b = [16; -7; 6; 7];

% Method 1: Inverse method
x_inv = (A)^(-1) * b;

% Method 2: Cramer's Rule
detA = det(A);

A1 = [b(1:4, 1) A(1:4, 2:4)];
detA1 = det(A1);

A2 = [A(1:4, 1) b(1:4, 1) A(1:4, 3:4)];
detA2 = det(A2);

A3 = [A(1:4, 1:2) b(1:4, 1) A(1:4, 4)];
detA3 = det(A3);

A4 = [A(1:4, 1:3) b(1:4, 1)];
detA4 = det(A4);

x_cramer = [detA1/detA;
            detA2/detA;
            detA3/detA;
            detA4/detA];

disp('Problem B: Two Methods for a Linear System');

disp('Coefficient matrix A:');
disp(A);

disp('Right-hand-side vector b:');
disp(b);

disp('Solution using the inverse method, x_inv:');
disp(x_inv);

disp('Solution using Cramer''s Rule, x_cramer:');
disp(x_cramer);

disp('det(A):');
disp(detA);

norm1 = norm(x_inv - x_cramer);
disp('norm(x_inv - x_cramer):');
disp(norm1);

norm2 = norm(A*x_inv - b);
disp('norm(A*x_inv - b):');
disp(norm2);
