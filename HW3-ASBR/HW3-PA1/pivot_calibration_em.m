function [b_tip,b_post] = pivot_calibration_em(pivot_calib_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: pivot.txt file
% Output: b_tip and b_post[1,3]
% Date: 4/23/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = importdata(pivot_calib_data);
probe_markers = str2double(cell2mat(A.textdata(1)));
data_frames = str2double(cell2mat(A.textdata(2)));
data = A.data;
data1 = zeros(probe_markers,3);
midpoint = zeros(1,3);
%Use first frame to define local probe coordinate frame 
for j=1:probe_markers
    midpoint = midpoint + data(j,:);
end
midpoint = midpoint./probe_markers;
%midpoints = zeros(data_frames,3);
%for i=1:data_frames
%    for j=1:probe_markers
%        midpoints(i,:) = midpoints(i,:) + data((i-1)*probe_markers+j,:);
%    end
%    midpoints(i,:) = midpoints(i,:)./probe_markers;
%end


for j=1:probe_markers
   data1(j,:) = data(j,:) - midpoint;  
end


%data = [data , ones(data_frames*probe_markers,1)];
%data1 = [data1 , ones(data_frames*probe_markers,1)];
R_matrix = zeros(data_frames*3,6);
p_matrix = zeros(data_frames*3,1);

for i=1:data_frames
   R_matrix(3*(i-1)+1:3*(i-1)+3,4:6) = -1*eye(3);
   G = data(probe_markers*(i-1)+1:probe_markers*(i-1)+probe_markers,:);
   T = set_registration(data1,G);
   
   R_matrix(3*(i-1)+1:3*(i-1)+3,1:3) = T(1:3,1:3);
   p_matrix(3*(i-1)+1:3*(i-1)+3,1) = -1.*T(1:3,4);
end

b =lsqminnorm(R_matrix,p_matrix);

b_tip = b(1:3,1);
b_post = b(4:6,1);
end


