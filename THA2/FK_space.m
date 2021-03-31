function [T_s,S,S_matrix,M]=FK_space(theta)
% generate space form FK using...
% information typically found in URDF

%example of URDF for kinematics of two joints:
    % </joint>
    % <joint name="joint1" type="continuous">
    % <parent link="base_link"/>
    % <child link="link1"/>
    % <origin rpy="0.0 0.0 0.0" xyz="0.0 0.0 0.089159"/>
    % <axis xyz="0 0 1"/>
    % </joint>
    % <joint name="joint2" type="continuous">
    % <parent link="link1"/>
    % <child link="link2"/>
    % <origin rpy="0.0 1.570796325 0.0"...
    % xyz="0.0 0.13585 0.0"/>
    % <axis xyz="0 1 0"/>
    
%sample info that can be extracted from an URDF
%each row corresponds to a sequential joint (there are 7)
rpy=[0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0];
xyz=[0 0 0;
    .250 0 0;
    .250 -.180 0;
    .250 -.360 0;
    .250 -.540 0;
    .250 -.720 0;
    .250 -.875 0];

%rows here need to be unit vectors
axis_xyz=[0 1 0;0 0 1;-1 0 0;0 0 1;-1 0 0;0 0 1;-1 0 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%determines M for all joints
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(4,4,length(theta)); %initilaize M
for i=1:length(theta)
%convert roll pitch yaw to rotation matrix (should ...
%be made into its own funciton)
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
orientations=zeros(3,3,length(theta));
positions=zeros(length(theta),3);
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
           T_sj=expm(S_matrix(:,:,j)*theta(j));
       else
           T_sj=T_sj*expm(S_matrix(:,:,j)*theta(j));
       end
    end
    T_s(:,:,i)=T_sj*M(:,:,i);
    orientations(:,:,i)=T_s(1:3,1:3,i);
    positions(i,:)=[T_s(1,4,i) T_s(2,4,i) T_s(3,4,i)];
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
labels={'1';'2';'3';'4';'5';'6';'7'};
Roboplot('init','Frames')
Roboplot('frames',orientations,positions,labels)
end












