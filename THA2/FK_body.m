function [T_b,B,B_matrix,M]=FK_body(theta)
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
%calculate T (new)
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
%calculate T (old)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=zeros(6,length(theta));
B_matrix=zeros(4,4,length(theta));
for i = 1:length(theta)
   %for each joint, determine the screw axis
   M_inv=inv(M(:,:,end));
   R=M_inv(1:3,1:3);
   p_matrix=[    0     -M_inv(3,4)  M_inv(2,4);
              M_inv(3,4)      0     -M_inv(1,4);
             -M_inv(2,4)  M_inv(1,4)      0];
   Ad_M_inv=[R zeros(3,3);
        p_matrix*R R];
   B(:,i)=Ad_M_inv*S(:,i)
   B_matrix(:,:,i)=[  0  -B(3,i)  B(2,i) B(1,4);
                   B(3,i)   0    -B(1,i) B(2,4);
                  -B(2,i) B(1,i)    0    B(3,4);
                      0     0       0     0];
   if i==1
       T_b=expm(B_matrix(:,:,i)*theta(i));
   else
       T_b=T_b*expm(B_matrix(:,:,i)*theta(i));
   end
end
T_b=M*T_b;
end