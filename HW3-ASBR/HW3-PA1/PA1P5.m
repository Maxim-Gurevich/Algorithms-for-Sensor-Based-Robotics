%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: opt_pivot.txt file and base transform
% Output: b_tip and b_post[1,3]
% Date: 4/25/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[opt_tip,opt_post] = pivot_calibration_opt('HW3-PA1_DATA/pa1-debug-a-optpivot.txt','HW3-PA1_DATA/pa1-debug-a-calbody.txt')
