function state = singularity(jacobian)
%SINGULARITY Summary of this function goes here
%Input = 6xn jacobian 
%returns 1 if in singularity, returns 0 if not in singularity
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

