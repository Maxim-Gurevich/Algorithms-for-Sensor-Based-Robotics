function volume = J_ellipsoid_volume(eig_vals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculate the volume of the manupility ellipsoid
% Input: eigenvalues (1D vector)
% Output: volume
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
volume = sqrt(eig_vals(1)*eig_vals(2)*eig_vals(3));
end

