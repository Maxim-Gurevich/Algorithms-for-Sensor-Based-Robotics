clc
clear all
close all

%import
[q_Robot_config, q_camera_config,t_Robot_config,t_camera_config ]...
    =data_quaternion();

num=10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%axis-angle method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%define matrix M
M=zeros(3);
for i=1:num
    R_A=Quat2RotMat(q_Robot_config(i,:));
    R_B=Quat2RotMat(q_camera_config(i,:));
    alpha=logm(R_A);
    beta=logm(R_B);
    M=M+(beta*alpha.');
end

%solve for R_x using eigen decomposition
[Q,D]=eig(M.'*M);
sqD=[1/sqrt(D(1,1)) 0 0;0 1/sqrt(D(2,2)) 0;0 0 1/sqrt(D(3,3))];
R_x=Q*sqD/Q*M.'

%solve for t_x using least squares
for i=1:num
    t_A=t_Robot_config(i,:).';
    t_B=t_camera_config(i,:).';
    R_A=Quat2RotMat(q_Robot_config(i,:));
    E(3*(i-1)+1:3*(i-1)+3,:)=R_x*t_B-t_A;
    F(3*(i-1)+1:3*(i-1)+3,:)=R_A-eye(3);
end
t_x=pinv(F)*E

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%quaternion method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Solve for R_x
clear M
for i=1:num
    s_a=q_Robot_config(i,1);
    v_a=q_Robot_config(i,2:4);
    s_b=q_camera_config(i,1);
    v_b=q_camera_config(i,2:4);
    vec=v_a+v_b;
    skew=[0   -vec(3) vec(2);
        vec(3)  0    -vec(1);
       -vec(2) vec(1)   0];
    M(4*(i-1)+1,1)=s_a-s_b;
    M(4*(i-1)+1,2:4)=-(v_a-v_b).';
    M(4*(i-1)+2:4*(i-1)+4,1)=v_a-v_b;
    M(4*(i-1)+2:4*(i-1)+4,2:4)=(s_a-s_b)*eye(3)+skew;
end
[U,S,V]=svd(M);
y=[0;0;0;1];
q_x=V*y;

%solve for translation vector p_x
R_xq=Quat2RotMat(q_x)
for i=1:num
    R_A=Quat2RotMat(q_Robot_config(i,:));
    t_a=t_Robot_config(i,:).';
    t_b=t_camera_config(i,:).';
    E(3*(i-1)+1:3*(i-1)+3,:)=R_xq*t_b-t_a;
    F(3*(i-1)+1:3*(i-1)+3,:)=R_A-eye(3);
end
t_xq=pinv(F)*E

%error measurement
R_Matrix_Difference_Norm=Matrix_Difference_Norm(R_x,R_xq)
t_x_Vector_Difference_Norm=norm(t_x-t_xq)
    
    
    
    
    