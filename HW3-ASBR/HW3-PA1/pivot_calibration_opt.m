function [b_tip,b_post] = pivot_calibration_opt(pivot_calib_data,cal_body_data)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates tip vector relative to ee and post vector
% relative to base frame
% Input: opt_pivot.txt file and base transform
% Output: b_tip and b_post[1,3]
% Date: 4/25/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = importdata(pivot_calib_data);
local = importdata(cal_body_data);

local_info = strsplit(cell2mat(local.textdata(1)),",");
Nd = str2double(cell2mat(local_info(1)));

local_data = local.data;
d = local_data(1:Nd,:);

text = cell2mat(A.textdata(1));
text = strsplit(text, ", ");
em_base_markers = str2double(cell2mat(text(1)));
probe_markers = str2double(cell2mat(text(2)));
data_frames = str2double(cell2mat(text(3)));
data = A.data; 

%Generate Fd
F_D = zeros(4*data_frames,4);
D = zeros(data_frames*em_base_markers,3);

for i=1:data_frames
    for j=1:em_base_markers
        D(em_base_markers*(i-1)+j,:) = data((em_base_markers+probe_markers)*(i-1)+j,:);
    end
end


for i=1:data_frames
  F_D_matrix = set_registration(d,D(em_base_markers*(i-1)+1:em_base_markers*(i-1)+em_base_markers,:));  
  F_D(4*(i-1)+1:4*(i-1)+4,:) = F_D_matrix;
end
%convert data to EM tracker coordinates

data = [data ones(data_frames*(em_base_markers+probe_markers),1)];

for z=1:data_frames
    for i=1:em_base_markers+probe_markers
        data((em_base_markers+probe_markers)*(z-1)+i,1:4) = inv(F_D(4*(z-1)+1:4*(z-1)+4,:))*(data((em_base_markers+probe_markers)*(z-1)+i,1:4).');
    end
end

data = data(:,1:3);
data1 = zeros(probe_markers,3);
midpoint = zeros(1,3);

for j=1:probe_markers
    midpoint = midpoint + data(j+em_base_markers,:);
end
midpoint = midpoint/probe_markers;


for j=1:probe_markers
   data1(j,:) = data(j+em_base_markers,:) - midpoint;  
end


R_matrix = zeros(data_frames*3,6);
p_matrix = zeros(data_frames*3,1);
for i=1:data_frames
   R_matrix(3*(i-1)+1:3*(i-1)+3,4:6) = -1*eye(3);
   H = data((em_base_markers+probe_markers)*(i-1)+em_base_markers+1:(em_base_markers+probe_markers)*(i-1)+em_base_markers+probe_markers,:);
   T = set_registration(data1,H);
   R_matrix(3*(i-1)+1:3*(i-1)+3,1:3) = T(1:3,1:3);
   p_matrix(3*(i-1)+1:3*(i-1)+3,1) = -1*T(1:3,4);
end

b = pinv(R_matrix)*p_matrix;

b_tip = b(1:3,1);
b_post = b(4:6,1);
end



