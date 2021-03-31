function state = singularity(jacobian)
%SINGULARITY Summary of this function goes here
%Input = 6x6 jacobian 
%returns 1 if in singularity, returns 0 if not in singularity
if det(jacobian) == 0
    state = 1;
else
    state = 0;

end

