% given URDF, generate space form FK

%example of URDF for two joints:
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%calculates M(1:3,1:3) by assuming a given...
%orientation of the end effector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(4); %initilaize M
M(1:4,1:3)=[1 0 0; 0 1 0; 0 0 1; 0 0 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculates M(1:3,4) by finding the sum of all...
%links in 3D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for each joint, determine the screw axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








