%% 3.3.4 Example 2: ∭ (x² + y² + z²) dV over ball x²+y²+z² ≤ 4
% Analytical: 128π/5

fun = @(rho,phi,theta) (rho.^2) .* (rho.^2 .* sin(phi));  % ρ⁴ sinφ

vol_ball = integral3(fun, 0, 2, 0, pi, 0, 2*pi);

fprintf('3.3.4 ∭(x²+y²+z²) dV over r≤2: %.4f  (Analytical: %.4f)\n', ...
    vol_ball, 128*pi/5);