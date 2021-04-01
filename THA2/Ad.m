function A = Ad(T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating angle and axis from rotation matrix
% Input: Transformation matrix (4x4)
% Output: Adjoint representation(6x6)
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = [T(1,4),T(2,4),T(3,4)];
A = [T(1:3,1:3),[0 0 0;0 0 0;0 0 0];[0 -p(3) p(2);p(3) 0 -p(1);-p(2) p(1) 0]*T(1:3,1:3),T(1:3,1:3)];
end

