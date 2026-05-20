clc;
clear;

syms x y z

% Define the function
f = x + y + z;

% Compute the triple integral
I = int(int(int(f, z, 0, x + y), ...
    y, 0, x), ...
    x, 0, 1);

disp('The value of the triple integral is:')
disp(simplify(I))