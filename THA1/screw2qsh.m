function [q,s,h] = screw2qsh(s_matrix)
%SCREW2QSH Summary of this function goes here
%   Detailed explanation goes here
w = s_matrix(1:3,1:3);
w3 = [w(3,2);w(1,3);w(2,1)];
w_l = sqrt(w3(1)^2+w3(2)^2+w3(3)^2);
v = s_matrix(1:3,4);
v_l = sqrt(v(1)^2+v(2)^2+v(3)^2);

s = w3/w_l;
h = v_l/w_l;
q = cross(s,v);
end

