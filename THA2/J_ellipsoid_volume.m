function volume = J_ellipsoid_volume(eig_vals)
%J_ELLIPSOID_VOLUME Summary of this function goes here
%   Detailed explanation goes here
volume = sqrt(eig_vals(1)*eig_vals(2)*eig_vals(3));
end

