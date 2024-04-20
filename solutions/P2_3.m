clear;
clc;

A = [
    -0.0366 0.0271 0.0188 -0.4555;
    0.0482 -1.0100 0.0024 -4.0208;
    0.1002 0.3681 -0.7070 1.4200;
    0 0 1 0
];
b1 = [
    0.4422;
    3.5445;
    -5.5200;
    0
];
b2 = [
    0.1761;
    -7.5922;
    4.4900;
    0
];

%% Problem (a): Eigenvalues of A
eig_A = eig(A)
if all(real(eig_A) < 0)
    disp('The system is stable')
else
    disp('The system is not stable')
end

%% Problem (b): Chracateristic polynomial associated with A
p = poly(A)
r = roots(p)

%% Problem (c): Controllability matrix
% Co = ctrb(A, [B1 B2]);
Co1 = ctrb(A, b1);
Co2 = ctrb(A, b2);

% rankCo = rank(Co)
rankCo1 = rank(Co1)
rankCo2 = rank(Co2)