function cond_number = J_condition(eig_vals)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculate the body Jacobian of robot
% Input: eigenvalues (1D vector)
% Output: condition number
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cond_number = max(eig_vals)/min(eig_vals);
end

