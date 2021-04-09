function [rpy,xyz,axis_xyz]=config()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: A place to store robot configuration data
% Input: N/A
% Output: configuration data typically found in URDF
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
rpy=[0 -pi/2 0;pi/2 0 0;0 0 0;0 -pi/2 0;0 0 0;pi/2 0 0;0 0 0];
%rpy=[0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0;0 0 0];
xyz=[0 0 0;
    .250  0 0;
    .250  0 .180;
    .250  0 .360;
    .250  0 .540;
    .250  0 .720;
    .250  0 .875];

%rows here need to be unit vectors
axis_xyz=[1 0 0;0 1 0;0 0 1;1 0 0;0 0 1;0 1 0;0 0 1];
end