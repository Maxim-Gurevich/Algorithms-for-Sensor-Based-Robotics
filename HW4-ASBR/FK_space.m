function [T_s,S,S_matrix,M]=FK_space(theta,graph)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % generate space form FK using...
% information typically found in URDF
% Input: theta, graph mode (0-no graph, 1-new graph,
%2-add to old graph
% Output: plot, transformation, screw axes, M
% Date: 3/30/21
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rpy,xyz,axis_xyz]=config();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%determines M for all joints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(4,4,length(theta)); %initilaize M
for i=1:length(theta)
    %convert roll pitch yaw to rotation matrix
    a=rpy(i,3);
    b=rpy(i,2);
    g=rpy(i,1);
    R=[cos(a)*cos(b) cos(a)*sin(b)*sin(g)-sin(a)*cos(g)...
        cos(a)*sin(b)*cos(g)+sin(a)*sin(g);
        sin(a)*cos(b) sin(a)*sin(b)*sin(g)+cos(a)*cos(g)...
        sin(a)*sin(b)*cos(g)-cos(a)*sin(g);
        -sin(b) cos(b)*sin(g) cos(b)*cos(g)];
    
    %set rotation part of M
    M(1:3,1:3,i)=R;
    
    %set xyz part
    M(1:4,4,i)=[xyz(i,1);xyz(i,2);xyz(i,3);1];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=zeros(6,length(theta));
S_matrix=zeros(4,4,length(theta));
T_s=zeros(4,4,length(theta));
orientations=zeros(3,3,length(theta)+1);
positions=zeros(length(theta)+1,3);
for i=1:length(theta)
    for j = 1:i
        v=cross(-axis_xyz(j,:),xyz(j,:));
        %for each joint, determine the screw axis
        S(:,j)=[axis_xyz(j,:) v];
        S_matrix(:,:,j)=[0  -axis_xyz(j,3) axis_xyz(j,2)  v(1);
            axis_xyz(j,3)       0        -axis_xyz(j,1) v(2);
            -axis_xyz(j,2) axis_xyz(j,1)       0         v(3);
            0        0             0          0];
        if j==1
            T_si=expm(S_matrix(:,:,j)*theta(j));
        else
            T_si=T_si*expm(S_matrix(:,:,j)*theta(j));
        end
    end
    T_s(:,:,i)=T_si*M(:,:,i);
    orientations(:,:,i)=inv(T_s(1:3,1:3,i));
    positions(i,:)=[T_s(1,4,i) T_s(2,4,i) T_s(3,4,i)];
end

orientations(:,:,i+1)=inv(T_s(1:3,1:3,i));
positions(i+1,:)=[T_s(1,4,i) T_s(2,4,i) T_s(3,4,i)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
labels={};
for i=1:length(theta)
    labels{end+1} = num2str(i);
end
if graph==1
    Roboplot('init','Frames')
    Roboplot('frames',orientations,positions,labels)
elseif graph==2
    Roboplot('frames',orientations,positions,labels)
end
end












