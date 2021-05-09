function T = screw_toT(w,v,t)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Sub function for Problem4.m. Converts screw parameters to
% exponential matrix form
% Input: w = [3x3] skew form, v = [3x1], theta
% Output: Transformation matrix [4x4]
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T= [exp(w*t),(eye(3)*t+(1-cos(t))*w+(t-sin(t))*w*w)*v;[0,0,0,1]];

end

