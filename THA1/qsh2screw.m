function S=qsh2screw(q,s_hat,h)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculating screw matrix from q s h form
% Input: Valid q,s,h
% Output: Screw Matrix (4x4)
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%W4-L1: The Screw Interpertation of a Twist
omega=s_hat;
v=cross(-s_hat,q)+h*s_hat;

S=[0 -omega(3) omega(2) v(1);
    omega(3) 0 -omega(1) v(2);
    -omega(2) omega(1) 0 v(3);
    0 0 0 0];
end