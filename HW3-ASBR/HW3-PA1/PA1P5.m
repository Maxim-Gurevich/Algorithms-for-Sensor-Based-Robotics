% Date: 4/25/21 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Find FD like in P3. Remember to make sure all text files have the same
% letter!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
local = importdata('HW3-PA1_DATA/pa1-debug-a-calbody.txt');
base = importdata('HW3-PA1_DATA/pa1-debug-a-calreadings.txt');

local_info = strsplit(cell2mat(local.textdata(1)),",");
base_info = strsplit(cell2mat(base.textdata(1)),",");

Nd = str2double(cell2mat(local_info(1)));
Na = str2double(cell2mat(local_info(2)));
Nc = str2double(cell2mat(local_info(3)));

ND = str2double(cell2mat(base_info(1)));
NA = str2double(cell2mat(base_info(2)));
NC = str2double(cell2mat(base_info(3)));
Nframes = str2double(cell2mat(base_info(4)));


local_data = local.data;
base_data = base.data;

d = local_data(1:Nd,:);
a = local_data(Nd+1:Nd+Na,:);
c = local_data(Nd+Na+1:Nd+Na+Nc,:);
c = [c ones(Nc,1)];

D = zeros(Nframes*ND,3);
A = zeros(Nframes*NA,3);
C = zeros(Nframes*Nc,4);

for i=1:Nframes
    for j=1:ND
        D(ND*(i-1)+j,:) = base_data((ND+NA+NC)*(i-1)+j,:);
    end
    for j=1:NA
        A(NA*(i-1)+j,:) = base_data((ND+NA+NC)*(i-1)+ND+j,:);
    end
end

for i=1:Nframes
    F_D_matrix = set_registration(d,D(ND*(i-1)+1:ND*(i-1)+ND,:));
    F_A_matrix = set_registration(a,A(NA*(i-1)+1:NA*(i-1)+NA,:));
    for j=1:Nc
        C(Nc*(i-1)+j,:)= inv(F_D_matrix)*F_A_matrix*(c(j,:)).';
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% transform the optical tracker beacon positions into EM tracker 
%coordinates using Fd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[em_tip,em_post] = pivot_calibration('HW3-PA1_DATA/pa1-debug-a-empivot.txt')
