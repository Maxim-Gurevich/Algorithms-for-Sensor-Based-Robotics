function R=Matrix_R(angles)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating rotation matrix from quaternion
% Input: Valid Quaternion
% Output: Rotation Matrix (3x3)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alp=angles(1);
bet=angles(2);
gam=angles(3);

R=[cos(alp)*cos(bet)*cos(gam)-sin(alp)*sin(gam) ...
    -cos(alp)*cos(bet)*sin(gam)-sin(alp)*cos(gam) ...
    cos(alp)*sin(bet);
    sin(alp)*cos(bet)*cos(gam)+cos(alp)*sin(gam) ...
    -sin(alp)*cos(bet)*sin(gam)+cos(alp)*cos(gam) ...
    sin(alp)*sin(bet);
    -sin(bet)*cos(gam) ...
    sin(bet)*sin(gam) ...
    cos(bet)];
end
