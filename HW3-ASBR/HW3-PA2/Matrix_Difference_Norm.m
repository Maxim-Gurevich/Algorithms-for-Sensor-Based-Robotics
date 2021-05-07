function E=Matrix_Difference_Norm(A,R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculates the matrix difference norm
% Input: two 3x3 matricies
% Output: difference norm as float
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E=trace((A-R)*transpose(A-R));
end
