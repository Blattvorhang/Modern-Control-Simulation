A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = 0;
x0 = [1; 0];

sys = ss(A, B, C, D);

% plot the system response when u = 0
t = 0:0.01:8;
lsim(sys, zeros(size(t)), t, x0);
