function [S, theta]=TMatrix2ScrewAngle(T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating screw matrix 4x4 and theta from transform
% Input: Valid Transformation Matrix (4x4)
% Output: Screw Matrix (4x4) and Theta (Radians)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract R, p from T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R= T(1:3,1:3);
p= T(1:3,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrix Logarithm of Rotations W2-L2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if R==eye(3)
    theta=0;
    omega=1/(2*sin(theta))*(R-transpose(R));
elseif trace(R)==-1
    theta=pi;
    omega_vector=(1/sqrt(2*(1+R(3,3))))*[R(1,3);R(2,3);1+R(3,3)];
    omega=[0 -omega_vector(3) omega_vector(2);
        omega_vector(3) 0 -omega_vector(1);
        -omega_vector(2) omega_vector(1) 0];
else
    theta=acos(.5*(trace(R)-1));
    
    omega=(1/(2*sin(theta)))*(R-transpose(R));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=(1/theta*eye(3)-.5*omega+...
    (1/theta-.5*cot(theta/2))*(omega^2))*p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construct S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=[omega v;
    0 0 0 0];
end