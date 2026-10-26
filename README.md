# ECE 2112 - Experiment 5: Introduction to MATLAB Programming

**Name:** Bacual, John Matthew P.

**Section:** 2ECE-A

**Date Submitted:** October 26, 2026

The content of this repository contains *Programming Assignment 5* for **ECE 2112: Advanced Computer Programming and Algorithms for S.Y. 2026–2027**. This project covers two MATLAB programming problems under Experiment 5: Introduction to MATLAB Programming.

## Objective

The objective of this experiment is to develop a basic understanding of MATLAB programming by creating real and complex matrices, performing transpose operations, and solving a system of linear equations using matrix operations.

Specifically, the experiment aims to:

1. Create real and complex matrices in MATLAB.
2. Distinguish the regular transpose from the complex-conjugate transpose.
3. Express a simultaneous linear system using a coefficient matrix and a right-hand-side vector.
4. Solve and check a linear system using the inverse method and Cramer's Rule.

## Detailed Discussion of the Experiment

### A. Transpose Operations

The first problem focuses on performing and comparing three transpose operations: `transpose(A)`, `A'`, and `A.'`. These operations are applied to the real matrix `R` and the complex matrix `Z`.

For the real matrix `R`, all three operations give identical results because its entries are real numbers. For the complex matrix `Z`, `transpose(Z)` and `Z.'` give identical results, while `Z'` also takes the complex conjugate of each entry. This reverses the sign of the imaginary part of each complex entry while leaving its real part unchanged.

The matrices are defined in MATLAB as follows:

```matlab
R = [5 -2  0  7;
     1  3 -4  2;
     6  0  8 -1];

Z = [2+3i -1+4i 5-2i;
    -3+1i   6   2+5i];
```

The script displays all three operations for each matrix using `transpose()`, the apostrophe operator (`'`), and the dot-apostrophe operator (`.'`).

**Results:**

- For `R`, `transpose(R)`, `R'`, and `R.'` give identical results.
- For `Z`, `transpose(Z)` and `Z.'` give identical results.
- For `Z`, `Z'` transposes the matrix and takes the complex conjugate of each entry.

These operations demonstrate the difference between a regular transpose and a complex-conjugate transpose.

---

### B. Two Methods for a Linear System

The second problem solves a system of four simultaneous linear equations using two methods: the inverse method and Cramer's Rule. The coefficient matrix is stored in `A`, while the constants on the right-hand side are stored in `b`.

```matlab
A = [2 -1  3  2;
     1  4 -2  1;
     3  2  1 -1;
    -2  3  4  2];

b = [16; -7; 6; 7];
```

#### Inverse Method

The inverse method calculates the solution by multiplying the inverse of `A` by `b`.

```matlab
x_inv = (A)^(-1) * b;
```

The resulting vector contains the values of the four unknowns in the system.

#### Cramer's Rule

Cramer's Rule calculates each unknown by dividing the determinant of a matrix formed by replacing one column of `A` with `b` by the determinant of the original matrix `A`.

The script first calculates `det(A)`. It then forms four replacement matrices, `A1`, `A2`, `A3`, and `A4`, replacing the first, second, third, and fourth columns of `A` with `b`, respectively. The determinant of each replacement matrix is calculated using `det()`.

```matlab
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
```

The resulting solution vector is stored in `x_cramer`. This approach uses matrix indexing, determinant calculations, and arithmetic without requiring a loop.

#### Numerical Checks

The script displays both solution vectors and the determinant of `A`. It also calculates two norm checks to verify the results.

```matlab
norm1 = norm(x_inv - x_cramer);
norm2 = norm(A*x_inv - b);
```

The first check compares the solutions obtained by the inverse method and Cramer's Rule. The second check evaluates how closely the inverse-method solution satisfies the original matrix equation `A*x = b`.

**Expected results:**

```text
det(A) = 280

x_inv =
     2
    -1
     3
     1

x_cramer =
     2
    -1
     3
     1
```

Both norm checks should be approximately zero, allowing for small numerical differences due to MATLAB's finite-precision calculations. These checks help confirm that both methods produce the same solution and that the solution satisfies the original system.

---

**Thank you for reading!**

To see the MATLAB program for Programming Assignment 5, click this link: 

README file Version History:

**October 26, 2026** - README created for Experiment 5: Introduction to MATLAB Programming.
