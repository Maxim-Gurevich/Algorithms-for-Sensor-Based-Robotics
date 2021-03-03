function [angle,axis,valid] = angle_axis_func(R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating angle and axis from rotation matrix
% Input: Square Matrix (nxn)
% Output: Validity of input matrix as rotation matrix and angle axis
% representation if so
% Date: 3/1/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    dim = size(R);
    if (length(dim)~=2 | dim(1)~=dim(2) | det(R)~=1)
         valid = "Not valid R";
         angle = 0;
         axis = 0;
    else
        angle = acos(.5*(trace(R)-1));
        axis = (R-transpose(R))/(2*sin(angle));
        if (angle == 0)
            valid = "Not valid R";
        else
            valid = "Valid R";
        end
    end
end

