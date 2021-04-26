function [b_tip,b_post] = pivot_calibration_opt(pivot_calib_data,Fd)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: opt_pivot.txt file and base transform
% Output: b_tip and b_post[1,3]
% Date: 4/25/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = importdata(pivot_calib_data);
text = cell2mat(A.textdata(1));
text = strsplit(text, ", ");
em_base_markers = str2double(cell2mat(text(1)));
probe_markers = str2double(cell2mat(text(2)));
data_frames = str2double(cell2mat(text(3)));
data = [A.data ones(size(A.data,1),1)];
%convert data to EM tracker coordinates
for i=1:size(data,1)
    data(i,1:4) = inv(Fd)*(data(i,1:4).');
end

data1 = data;
midpoints = [zeros(data_frames,3) ones(data_frames,1)];
for i=1:data_frames
    for j=1:probe_markers
        midpoints(i,:) = midpoints(i,:) + data((i-1)*probe_markers+j+em_base_markers,:);
    end
    midpoints(i,:) = midpoints(i,:)/probe_markers;
end

for i=1:data_frames
   for j=1:probe_markers
      data1((i-1)*probe_markers+j,:) = data((i-1)*probe_markers+j+em_base_markers,:) - midpoints(i,:);  
   end
end

R_matrix = zeros(data_frames*3,6);
p_matrix = zeros(data_frames*3,1);
for i=1:data_frames
   R_matrix(3*(i-1)+1:3*(i-1)+3,4:6) = -1*eye(3);
   T = set_registration(data1(probe_markers*(i-1)+1:probe_markers*(i-1)+probe_markers,1:3),data(probe_markers*(i-1)+1:probe_markers*(i-1)+probe_markers,1:3));
   R_matrix(3*(i-1)+1:3*(i-1)+3,1:3) = T(1:3,1:3);
   p_matrix(3*(i-1)+1:3*(i-1)+3,1) = -1*T(1:3,4);
end

b = pinv(R_matrix)*p_matrix;

b_tip = b(1:3,1);
b_post = b(4:6,1);
end



