function isotropy = J_isotropy(eig_vals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculate the isotropy of the manupility ellipsoid
% Input: eigenvalues (1D vector)
% Output: isotropy
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
isotropy = sqrt(max(eig_vals))/sqrt(min(eig_vals));
end

