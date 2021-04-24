function [b_tip,b_post] = pivot_calibration(pivot_calib_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: pivot.txt file
% Output: b_tip and b_post[1,3]
% Date: 4/23/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = importdata('HW3-PA1_DATA/'+pivot_calib_data);
probe_markers = str2double(cell2mat(A.textdata(1)));
data_frames = str2double(cell2mat(A.textdata(2)));
data = A.data;
data1 = A.data;
midpoints = zeros(data_frames,3);
for i=1:data_frames
    for j=1:probe_markers
        midpoints(i,:) = midpoints(i,:) + data((i-1)*probe_markers+j,:);
    end
    midpoints(i,:) = midpoints(i,:)/probe_markers;
end

for i=1:data_frames
   for j=1:probe_markers
      data1((i-1)*probe_markers+j,:) = data((i-1)*probe_markers+j,:) - midpoints(i,:);  
   end
end

R_matrix = zeros(data_frames*probe_markers,2);
p_matrix = zeros(data_frames*probe_markers,1);
for i=1:data_frames*probe_markers
   R_matrix(i,2) = -1*eye(3);
   T = set_registration(data1,data);
   R_matrix(i,1) = T(1:3,1:3);
   p_matrix(i,1) = -1*T(1:3,4);
end
b = inv(R_matrix)*p_matrix;

b_tip = b(1);
b_post = b(2);
end


