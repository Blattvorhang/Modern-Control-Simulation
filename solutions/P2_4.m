clear;
clc;

A = [
    0 0 0 1 0 0;
    0 0 0 0 1 0;
    0 0 0 0 0 1;
    7.3809 0 0 0 2 0;
    0 -2.1904 0 -2 0 0;
    0 0 -3.1904 0 0 0
];
b1 = [0; 0; 0; 1; 0; 0];
b2 = [0; 0; 0; 0; 1; 0];
b3 = [0; 0; 0; 0; 0; 1];

n = length(A)

%% Problem (a): Verify the stability of the translunar equilibrium point
eig_A = eig(A)
if all(real(eig_A) < 0)
    disp('The translunar equilibrium point is stable')
else
    disp('The translunar equilibrium point is unstable')
end

%% Problem (b): Controllability of u1
Co1 = ctrb(A, b1);
rankCo1 = rank(Co1)

%% Problem (c): Controllability of u2
Co2 = ctrb(A, b2);
rankCo2 = rank(Co2)

%% Problem (d): Controllability of u3
Co3 = ctrb(A, b3);
rankCo3 = rank(Co3)

%% Problem (e): Transfer function from u2 to eta
c = [0 1 0 0 0 0];
d = 0;
sys = ss(A, b2, c, d);
Gu2_eta = tf(sys)

%% Problem (f): State-space representation of the tf in (e)
G_new = ss(Gu2_eta)
Co_new = ctrb(G_new);
rankCo_new = rank(Co_new)

%% Problem (g): Design a controller u2 = -Kx
% the poles of the closed-loop system
s1 = -1 + 1j;
s2 = -1 - 1j;
s3 = -9.999;
s4 = -10.001;
poles = [s1 s2 s3 s4];
K = place(G_new.A, G_new.B, poles)