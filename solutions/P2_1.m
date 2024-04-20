A = [0 1; -2 -4.5];
B = [0; 1];
C = [1 0];
D = 0;

n = length(A);

%% Controllability
Qc = ctrb(A, B);
rankCtrb = rank(Qc);

if rankCtrb == n
    disp('The system is controllable');
else
    disp('The system is not controllable');
end

%% Observability
Qo = obsv(A, C);
rankObsv = rank(Qo);

if rankObsv == n
    disp('The system is observable');
else
    disp('The system is not observable');
end

%% Transfer function
sys = ss(A, B, C, D);
tf = tf(sys)
