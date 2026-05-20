%% 3.4.7 Example 3: Volume of an Ellipsoid using Jacobian

clear; clc;

% ====================== JACOBIAN TRANSFORMATION METHOD ======================
syms u v w

% Linear transformation: x=2u, y=3v, z=4w
x = 2*u;
y = 3*v;
z = 4*w;

J_matrix = jacobian([x; y; z], [u v w]);
detJ = det(J_matrix);
abs_detJ = abs(detJ);

fprintf('Jacobian Determinant  = %s\n', char(detJ));
fprintf('Absolute Value |J|     = %.0f\n\n', double(abs_detJ));

% Volume of unit ball u² + v² + w² ≤ 1 is 4π/3
vol_unit_ball = 4/3 * pi;
volume = double(abs_detJ) * vol_unit_ball;

fprintf('Volume of Ellipsoid = %.4f π\n', volume/pi);
fprintf('                    = %.6f\n', volume);

% ====================== FIXED NUMERICAL VERIFICATION ======================
% Using triple integral in Cartesian with proper vectorization

vol_numerical = integral3(@(x,y,z) ones(size(x)), ...   % Vectorized integrand
    -2, 2, ...                                           % x limits
    @(x) -3*sqrt(1 - x.^2/4), @(x) 3*sqrt(1 - x.^2/4), ... 
    @(x,y) -4*sqrt(1 - x.^2/4 - y.^2/9), @(x,y) 4*sqrt(1 - x.^2/4 - y.^2/9), ...
    'Method', 'auto', 'RelTol', 1e-6);

fprintf('\nNumerical Integration Result = %.6f\n', vol_numerical);
fprintf('Error = %.2e\n', abs(volume - vol_numerical));
