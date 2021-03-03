function [ZYZ_angles,ZYX_angles,valid] = euler_angle_func(R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating euler angles ZYZ and ZYX
% Input: Square Matrix (nxn)
% Output: Validity of input as rotation matrix and euler angles if so
% Date: 3/3/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    dim = size(R);
    zyz_angles = [0 0 0];
    zyx_angles = [0 0 0];
    tolerance = .05;
    valid = "";
    if (length(dim)~=2 | dim(1)~=dim(2) | det(R)~=1 | dim(1)~=3)
         valid = strcat(valid,"Not valid R");
         ZYZ_angles = zyz_angles;
         ZYX_angles = zyx_angles;
    else
        if (mod(R,eye(3)) == zeros(3))
            valid = strcat(valid,"Singularity for ZYZ");
        end
        angle = acos(.5*(trace(R)-1));
        if (abs(angle)-pi/2 <tolerance)
            valid = strcat(valid," Singularity for ZYX");
        end
        zyz_angles(1)= atan2(R(2,3),R(1,3));
        zyz_angles(2)= atan2(sqrt(R(1,3)^2+R(2,3)^2),R(3,3));
        zyz_angles(3)= atan2(R(3,2),-1*R(3,1));
        ZYZ_angles = zyz_angles;
        if (angle < pi/2 && angle > -1*pi/2)
            zyx_angles(1) = atan2(R(2,1),R(1,1));
            zyx_angles(2) = atan2(-1*R(3,1),sqrt(R(3,2)^2 + R(3,3)^2));
            zyx_angles(3) = atan2(R(3,2),R(3,3));
        elseif (angle < pi/2 && angle > -1*pi/2)
            zyx_angles(1) = atan2(-1*R(2,1),-1*R(1,1));
            zyx_angles(2) = atan2(-1*R(3,1),-1*sqrt(R(3,2)^2 + R(3,3)^2));
            zyx_angles(3) = atan2(-1*R(3,2),-1*R(3,3));
        end
        ZYX_angles= zyx_angles;
    end
end