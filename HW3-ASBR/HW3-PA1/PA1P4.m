%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: pivot.txt file
% Output: em_tip and em_post[1,3]
% Date: 4/27/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[em_tip,em_post] = pivot_calibration_em('HW3-PA1_DATA/pa1-debug-a-empivot.txt')