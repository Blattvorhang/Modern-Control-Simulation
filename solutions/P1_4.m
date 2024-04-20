num_con = 3;
den_con = [1 3];
sys_con = ss(tf(num_con, den_con));

num_pro = 1;
den_pro = [1 2 5];
sys_pro = ss(tf(num_pro, den_pro));

open_loop = series(sys_con, sys_pro);
closed_loop = feedback(open_loop, 1)

% Impulse response
impulse(closed_loop);