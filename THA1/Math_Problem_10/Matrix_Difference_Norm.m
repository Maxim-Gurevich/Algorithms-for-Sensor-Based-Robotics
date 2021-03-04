function E=Matrix_Difference_Norm(A,R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating rotation matrix from quaternion
% Input: Valid Quaternion
% Output: Rotation Matrix (3x3)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E=trace((A-R)*transpose(A-R));
end
