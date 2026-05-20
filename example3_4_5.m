%% 3.4.5 Example 2: Transformation to a Parallelepiped using Jacobian

clear; clc;

% ====================== SYMBOLIC JACOBIAN ======================
syms u v w

x = u + v;
y = u - v;
z = w;

J_matrix = jacobian([x; y; z], [u, v, w]);
detJ = det(J_matrix);
abs_detJ = abs(detJ);

fprintf('Jacobian Determinant  = %s\n', char(detJ));
fprintf('Absolute Value |J|     = %.0f\n\n', double(abs_detJ));

% ====================== NUMERICAL INTEGRATION ======================
% |J| is constant (=2), so we integrate 2 over the region G

volume = integral3(@(u,v,w) 2 * ones(size(u)), ...  % Vectorized constant function
                   0, 1, ...   % u limits
                   0, 2, ...   % v limits
                   0, 3, ...   % w limits, ...
                   'Method', 'auto');

fprintf('Volume of the Parallelepiped = %.4f\n', volume);
fprintf('Analytical: |J| × volume of G = 2 × (1 × 2 × 3) = 12\n');