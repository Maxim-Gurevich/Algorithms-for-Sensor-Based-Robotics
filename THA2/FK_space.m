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
    
%sample end effector info (can be extracted from an URDF)
roll=0;
pitch=0;
yaw=0;
x=1;
y=1;
z=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%determines M from data pertaining to last link in URDF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(4); %initilaize M

%convert roll pitch yaw to rotation matrix (should ...
%be made into its own funciton)
a=yaw;
b=pitch;
g=roll;
R=[cos(a)*cos(b) cos(a)*sin(b)*sin(g)-sin(a)*cos(g) cos(a)*sin(b)*cos(g)+sin(a)*sin(g);
    sin(a)*cos(b) sin(a)*sin(b)*sin(g)+cos(a)*cos(g) sin(a)*sin(b)*cos(g)-cos(a)*sin(g);
    -sin(b) cos(b)*sin(g) cos(b)*cos(g)];

%set appropriate part of M
M(1:3,1:3)=R;

%set xyz part
M(1:4,4)=[x;y;z;1];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for each joint, determine the screw axis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








