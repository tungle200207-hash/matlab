clear; clc;

%% 3.3.3 Example 1: Volume of a Sphere  x²+y²+z² ≤ 9
% Analytical: 36π

fun = @(x,y,z) 1;

% Using spherical coordinates (better for sphere)
rho_max = 3;
vol_sphere = integral3(@(rho,phi,theta) rho.^2 .* sin(phi), ...
    0, rho_max, 0, pi, 0, 2*pi);

fprintf('3.3.3 Volume of Sphere (r=3): %.4f  (Analytical: %.4f)\n', ...
    vol_sphere, 36*pi);