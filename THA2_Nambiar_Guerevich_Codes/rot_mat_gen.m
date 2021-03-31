function [rot_mat] = rot_mat_gen(axis,angle)
%ROT_MAT_GEN Summary of this function goes here
%   Generates rotation matrix for primary axes

if axis == 'x'
    rot_mat = [1 0 0;0 cosd(angle) -sind(angle);0 sind(angle) cosd(angle)];
elseif axis == 'y'
    rot_mat = [cosd(angle) 0 sind(angle);0 1 0;-sind(angle) 0 cosd(angle)];
else
    rot_mat = [cosd(angle) -sind(angle) 0;sind(angle) cosd(angle) 0;0 0 1];
    
end
end

