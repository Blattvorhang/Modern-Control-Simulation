close all;
clear;
clc;
% syms K;
% A = [0 1 0; 0 0 1; -2 -K -2];
% B = [0; 0; 1];
% C = [1 0 0];
% D = 0;
% sys = ss(A,B,C,D);

% Plot the characterstic values of the system
% as a function of K in the range 0 to 100
K = 0:0.01:100;
eig_vals = zeros(length(K), 3);
for i = 1:length(K)
    A = [0 1 0; 0 0 1; -2 -K(i) -2];
    eig_vals(i,:) = sort(eig(A));
end

% Determine that range of K for which all the characteristic values lie in the left half-plane.
K_stable = K(find(all(real(eig_vals) < 0, 2), 1))

figure;
plot(K, real(eig_vals(:,1)), 'r');
hold on;
plot(K, real(eig_vals(:,2)), 'g');
plot(K, real(eig_vals(:,3)), 'b');
xlabel('K');
ylabel('Real Part');
legend('\lambda_1', '\lambda_2', '\lambda_3');
grid on;

% Plot the trajectory of the eigenvalues in the complex plane
figure;
for i = 1:size(eig_vals, 2)
    plot(real(eig_vals(:,i)), imag(eig_vals(:,i)), '.');
    hold on;
end
xlabel('Real Part');
ylabel('Imaginary Part');
title('Trajectory of the eigenvalues in the complex plane');
legend('\lambda_1', '\lambda_2', '\lambda_3');
grid on;