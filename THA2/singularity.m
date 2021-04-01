function state = singularity(jacobian)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Returns boolean if robot in singularity (0 not, 1 yes)
% Input: Jacobian [6xn]
% Output: singularity?
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dims = size(jacobian);
if dims(2)>6
    max_rank = 6;
else
    max_rank = dims(2);
end
if rank(jacobian) < max_rank
    state = 1;
else
    state = 0;

end

