%% 3.3.5 Example 3: Volume of Upper Hemisphere  x²+y²+z² ≤ 16, z≥0
% Analytical: 128π/3  (half of sphere r=4)

vol_hemisphere = integral3(@(rho,phi,theta) rho.^2 .* sin(phi), ...
    0, 4, 0, pi/2, 0, 2*pi);   % φ from 0 to π/2

fprintf('3.3.5 Upper Hemisphere (r=4): %.4f  (Analytical: %.4f)\n', ...
    vol_hemisphere, 128*pi/3);