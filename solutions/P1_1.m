num1 = 1;
den1 = [1 10];
sys1 = tf(num1, den1);
ss1 = ss(sys1)

num2 = [1 5 3];
den2 = [1 8 5];
sys2 = tf(num2, den2);
ss2 = ss(sys2)