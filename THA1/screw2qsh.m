function [q,s,h] = screw2qsh(s_matrix)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating q s h of screw from screw matrix
% Input: Valid Screw Matrix (4x4)
% Output: q (point on screw axis), h (pitch), s (directional screw vector)
% Date: 3/3/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w = s_matrix(1:3,1:3);
w3 = [w(3,2);w(1,3);w(2,1)];
w_l = sqrt(w3(1)^2+w3(2)^2+w3(3)^2);
v = s_matrix(1:3,4);
v_l = sqrt(v(1)^2+v(2)^2+v(3)^2);

s = w3/w_l;
h = v_l/w_l;
q = cross(w3,v);
end

