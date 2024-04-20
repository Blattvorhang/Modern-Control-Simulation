A = [
    0 1 0 0 0;
    -0.1 -0.5 0 0 0;
    0.5 0 0 0 0;
    0 0 10 0 0;
    0.5 1 0 0 0
];
B = [0; 1; 0; 0; 0];
C = [0 0 0 1 0];
D = 0;

%% Problem (a): Controllability
Qc = ctrb(A, B);
rankCtrb = rank(Qc);
disp(['Rank of Controllability Matrix: ', num2str(rankCtrb)]);
if rankCtrb == length(A)
    disp('System is controllable');
else
    disp('System is not controllable');
end

%% Problem (b): Tansfer function
Gss = ss(A, B, C, D);
Gtf = tf(Gss);
modified_Gss = ss(Gtf)

%% Problem (c): Controllability of modified system
modified_Qc = ctrb(modified_Gss);
modified_rankCtrb = rank(modified_Qc);
disp(['Rank of Controllability Matrix of modified system: ', num2str(modified_rankCtrb)]);
if modified_rankCtrb == length(modified_Gss.A)
    disp('Modified system is controllable');
else
    disp('Modified system is not controllable');
end