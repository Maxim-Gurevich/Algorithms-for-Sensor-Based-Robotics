clc
clear all
close all
%function [R_x,t_x,R_xq,t_x]=
noise=1;
num=5%number of data points considered

%import
if noise==1
    [q_Robot_config, q_camera_config,t_Robot_config,...
        t_camera_config ]=data_quaternion_noisy();
    
else
     [q_Robot_config, q_camera_config,t_Robot_config,...
        t_camera_config ]=data_quaternion();   
end

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
    
    