%% 3.4.3 Linear Scaling Transformation using Jacobian

clear; clc;

% Transformation:
% x = 2u
% y = 3v
% z = 4w

% New region G: Unit cube
% 0 ≤ u ≤ 1, 0 ≤ v ≤ 1, 0 ≤ w ≤ 1

% Step 1: Compute Jacobian determinant
% J = ∂(x,y,z)/∂(u,v,w) = | 2  0  0 |
%                         | 0  3  0 |
%                         | 0  0  4 |  = 2*3*4 = 24

J = 2 * 3 * 4;

% Step 2: Integrate over the unit cube G with Jacobian factor
volume = integral3(@(u,v,w) J * ones(size(u)), ...
                   0, 1, ...   % u limits
                   0, 1, ...   % v limits
                   0, 1);      % w limits

fprintf('Volume using Jacobian Transformation = %.4f\n', volume);
fprintf('Analytical result (length×width×height) = 2×3×4 = %d\n', 2*3*4);
