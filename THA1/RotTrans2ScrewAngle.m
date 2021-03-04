function [S,theta]=RotTrans2ScrewAngle(R,p)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating screw matrix from rotation matrix and
% translation vector
% Input: Valid R(3x3) and p(3x1)
% Output: Screw Matrix (4x4) and Theta (Radians)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrix Logarithm of Rotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if R==eye(3)
    theta=0;
elseif trace(R)==-1
    theta=pi;
    omega=(1/sqrt(2*(1+R(3,3))))*[R(1,3);R(2,3);1+R(3,3)];
else
    theta=acos(.5*(trace(R)-1));
    omega=(1/(2*sin(theta)))*(R-transpose(R))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=(1/theta*eye(3)-1/2*omega+...
    (1/theta-1/2*cot(theta/2))*(omega^2))*p

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construct S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=[omega v;
    0 0];
end