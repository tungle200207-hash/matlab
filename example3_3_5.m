%% 3.3.5 Example: Volume of the Upper Hemisphere
% Region: x² + y² + z² ≤ 16, z ≥ 0  (Radius = 4)

clc;
clear;

%% Method 1: Symbolic Integration (Spherical Coordinates) - Recommended
syms rho phi theta

integrand = rho^2 * sin(phi);

V = int(int(int(integrand, rho, 0, 4), ...     % rho: 0 to 4
            phi, 0, pi/2), ...                 % phi: 0 to π/2 (upper half)
            theta, 0, 2*pi);                   % theta: 0 to 2π

fprintf('Volume of Upper Hemisphere (Symbolic):\n');
disp(V);

fprintf('Numerical Value = %.6f\n', double(V));
fprintf('Exact Answer    = 128π/3 ≈ %.6f\n', 128*pi/3);


%% Method 2: Numerical Integration using integral3 (Cartesian)
vol_num = integral3(@(x,y,z) ones(size(x)), ...
    -4, 4, ...                                           % x
    @(x) -sqrt(16 - x.^2), @(x) sqrt(16 - x.^2), ...   % y
    @(x,y) 0, @(x,y) sqrt(16 - x.^2 - y.^2), ...       % z from 0 to upper
    'Method','tiled');

fprintf('\nNumerical (integral3) = %.6f\n', vol_num);


%% Method 3: Using Spherical Coordinates Numerical
vol_sph = integral3(@(rho,phi,theta) rho.^2 .* sin(phi), ...
    0, 4, 0, pi/2, 0, 2*pi);

fprintf('Numerical Spherical      = %.6f\n', vol_sph);
