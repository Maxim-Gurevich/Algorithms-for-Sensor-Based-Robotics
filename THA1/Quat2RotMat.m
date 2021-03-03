function R=Quat2RotMat(q0,q1,q2,q3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating rotation matrix from quaternion
% Input: Valid Quaternion
% Output: Rotation Matrix (3x3)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R=zeros(3);
R(1,1)=2*(q0^2+q1^2)-1;
R(1,2)=2*(q1*q2-q0*q3);
R(1,3)=2*(q1*q3+q0*q2);

R(2,1)=2*(q1*q2+q0*q3);
R(2,2)=2*(q0^2+q2^2)-1;
R(2,3)=2*(q2*q3-q0*q1);

R(3,1)=2*(q1*q3-q0*q2);
R(3,2)=2*(q2*q3+q0*q1);
R(3,3)=2*(q0^2+q3^2)-1;
end