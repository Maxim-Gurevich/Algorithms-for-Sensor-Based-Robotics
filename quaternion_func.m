function [f,valid] = quaternion_func(R)
%QUATERNION_FUNC Summary of this function goes here
%   Detailed explanation goes here
    dim = size(R);
    quaternion = [0 0 0 0];
    if (length(dim)~=2 | dim(1)~=dim(2) | det(R)~=1 | dim(1)~=3)
         valid = "Not valid R";
         f = quaternion;
    else
        valid = "Valid R";
        quaternion(1)=.5*sqrt(R(1,1)+R(2,2)+R(3,3)+1);
        quaternion(2)=.5*sign(R(3,2)-R(2,3))*sqrt(R(1,1)-R(2,2)-R(3,3)+1);
        quaternion(3)=.5*sign(R(1,3)-R(3,1))*sqrt(R(2,2)-R(3,3)-R(1,1)+1);
        quaternion(4)=.5*sign(R(2,1)-R(1,2))*sqrt(R(3,3)-R(1,1)-R(2,2)+1);
    
        f = quaternion;
    end
end