function cond_number = J_condition(eig_vals)
%J_CONDITION Summary of this function goes here
%   Detailed explanation goes here
cond_number = max(eig_vals)/min(eig_vals);
end

