clc
clear all
close all

%import
[q_Robot_config, q_camera_config,t_Robot_config,...
    t_camera_config ]=data_quaternion();

num=10;%number of data points considered

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%axis-angle method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[R_x,t_x]=Hand_Eye_Axis_Angle(q_Robot_config,...
    q_camera_config,t_Robot_config,t_camera_config,num)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%quaternion method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[R_xq,t_xq]=Hand_Eye_Quaternion(q_Robot_config,...
    q_camera_config,t_Robot_config,t_camera_config,num)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%error measurement
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R_Matrix_Difference_Norm=Matrix_Difference_Norm(R_x,R_xq)
t_x_Vector_Difference_Norm=norm(t_x-t_xq)
    
    
    
    
    