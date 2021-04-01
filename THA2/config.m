function [rpy,xyz,axis_xyz]=config()
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
axis_xyz=[0 1 0;0 0 1;-1 0 0;0 0 1;-1 0 0;0 0 1;0 -1 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rpy=[0 0 0;0 0 0;0 0 0;0 0 0];
xyz=[0 0 0;
    0 0 1;
    0 1 1;
    0 1 1];

axis_xyz=[0 0 1;1 0 0;0 0 1;0 1 0];
end