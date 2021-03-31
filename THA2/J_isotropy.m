function isotropy = J_isotropy(eig_vals)
%J_isotropy: Summary of this function goes here
%   Detailed explanation goes here
isotropy = sqrt(max(eig_vals))/sqrt(min(eig_vals));
end

