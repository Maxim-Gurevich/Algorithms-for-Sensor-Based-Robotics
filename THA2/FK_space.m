function T=FK_space(theta)
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
    250 0 0;
    250 -180 0;
    250 -360 0;
    250 -540 0;
    250 -720 0;
    250 -875 0];

%rows here need to be unit vectors
axis_xyz=[0 1 0;0 0 1;-1 0 0;0 0 1;-1 0 0;0 0 1;-1 0 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%determines M from data pertaining to last link in URDF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M=zeros(4); %initilaize M

%convert roll pitch yaw to rotation matrix (should ...
%be made into its own funciton)
a=rpy(end,3);
b=rpy(end,2);
g=rpy(end,1);
R=[cos(a)*cos(b) cos(a)*sin(b)*sin(g)-sin(a)*cos(g)...
    cos(a)*sin(b)*cos(g)+sin(a)*sin(g);
    sin(a)*cos(b) sin(a)*sin(b)*sin(g)+cos(a)*cos(g)...
    sin(a)*sin(b)*cos(g)-cos(a)*sin(g);
    -sin(b) cos(b)*sin(g) cos(b)*cos(g)];

%set rotation part of M
M(1:3,1:3)=R;

%set xyz part
M(1:4,4)=[xyz(end,1);xyz(end,2);xyz(end,3);1];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%theta=[pi pi pi pi pi pi]/8;
for i = 1:length(theta)
   v=cross(-axis_xyz(i,:),xyz(i,:));
   %for each joint, determine the screw axis
   S=[      0       -axis_xyz(i,3) axis_xyz(i,2)  v(1);
       axis_xyz(i,3)       0       -axis_xyz(i,1) v(2);
       -axis_xyz(i,2) axis_xyz(i,1)      0        v(3);
            0              0             0         0];
   if i==1
       T=exp(S*theta(i));
   else
       T=T*exp(S*theta(i));
   end
end
T=T*M;
end
