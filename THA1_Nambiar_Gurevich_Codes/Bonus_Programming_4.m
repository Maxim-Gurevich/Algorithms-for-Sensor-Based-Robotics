function [within,R]=Bonus_Programming_4(A,threshold)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Returns boolean and similar SO(3) matrix to input
% Input: 3x3 matrix
% Output: boolean, simmilar matrix
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [M,diff]=Bonus_Math_10(A);
    if diff>threshold
        within=false;
    else
        within=true;  
    end
    R=M;
end