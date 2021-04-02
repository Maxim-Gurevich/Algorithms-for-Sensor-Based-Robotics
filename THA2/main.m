%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Debugging all the subfunctions for PA 2
% Input: 
% Output: 
% Date: 3/30/21 
% Author: Zahin Nambiar,Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
theta1=[0 0 0 0 0 0 0];
theta2=[-.2 .3 1 -1 2 1.5 1];
theta3=[-.2 .3 1 -1];
graph=1;

[T_s1,S1,S_matrix1,M1]=FK_space(theta1,graph)
[T_s2,S2,S_matrix2,M2]=FK_space(theta2,graph)
[T_s3,S3,S_matrix3,M3]=FK_space(theta3,graph)
%%
Roboplot('init','Title goes here')
%Roboplot('frames',[1 0 0;0 1 0;0 0 1],[1 1 1],'test')
%%
theta1=[0 0 0 0 0 0 0];
theta2=[-.2 .3 1 -1 2 1.5 1];
theta3=[-.2 .3 1 -1];
graph=1;

[T_b1,B1,B_matrix1,M1]=FK_body(theta1,graph)
[T_b2,B2,B_matrix2,M2]=FK_body(theta2,graph)
[T_b3,B3,B_matrix3,M3]=FK_body(theta3,graph)
%%
%[J_s]=J_space(theta,graph)
%[J_s]=J_space([0 0 0 0 0 0 0],0)
%[J_s]=J_space([-.2 .3 1 -1 2 1.5 1],0)
%[J_s]=J_space([-.2 .3 1 -1],0)

%%
%[J_b]=J_body(theta,graph)
%[J_b]=J_body([0 0 0 0 0 0 0],0)
%[J_b]=J_body([-.2 .3 1 -1 2 1.5 1],0)
[J_b]=J_body([-.2 .3 1 -1],0)
%%
singularity([1 2 ;4 5 ;7 8;10 11;13 14;16 17]);
%singularity([1,2,3,4,5,6;7,8,9,10,11,12;13,14,15,16,17,18;19,20,21,22,23,24;25,26,27,28,29,30;31,32,33,34,35,36]);
%singularity([1,2,3,7,35,6;7,8,9,10,111,12;13,14,125,16,17,18;19,20,21,22,23,24;25,26,27,28,29,30;31,35,33,34,35,36]);
%%
%ellipsoid_plot_angular.m
[a,b] = ellipsoid_plot_angular(eye(6))
[c,d] = ellipsoid_plot_angular([1,2,3,4,5,6;7,8,9,10,11,12;13,14,15,16,17,18;19,20,21,22,23,24;25,26,27,28,29,30;31,32,33,34,35,36])

%%
%ellipsoid_plot_linear.m
[e,f] = ellipsoid_plot_linear(eye(6))
[g,h] = ellipsoid_plot_linear([1,2,3,4,5,6;7,8,9,10,11,12;13,14,15,16,17,18;19,20,21,22,23,24;25,26,27,28,29,30;31,32,33,34,35,36])

%%
%J_isotropy.m
J_isotropy(a)
J_isotropy(c)

%%
%J_condition.m
J_condition(a)
J_condition(c)

%%
%J_ellipsoid_volume.m
J_ellipsoid_volume(a)
J_ellipsoid_volume(c)

%%
theta1=[-.2 .3 1 -1 2 1.5 1];
T_sd1=[0.09 -0.48 -0.87 0.0354;
    -0.98 0.08 -.14 0.25;
    0.14 0.87 -0.46 0.48
    0 0 0 1];

T_sd2=[0.09 -0.48 -0.87 .1;
    -0.98 0.08 -.14 .1;
    0.14 0.87 -0.46 .1;
    0 0 0 1];
theta=J_inverse_kinematics(T_sd1,theta1)
theta=J_inverse_kinematics(T_sd2,theta1)
%%
theta1=[-.2 .3 1 -1 2 1.5 1];
T_sd1=[0.09 -0.48 -0.87 0.03;
    -0.98 0.08 -.14 0.2;
    0.14 0.87 -0.46 0.4
    0 0 0 1];

T_sd2=[0.09 -0.48 -0.87 .1;
    -0.98 0.08 -.14 .1;
    0.14 0.87 -0.46 .1;
    0 0 0 1];
theta=J_transpose_kinematics(T_sd1,theta1)
theta=J_transpose_kinematics(T_sd2,theta1)
%%
theta1=[-.2 .3 1 -1 2 1.5 1];
T_sd1=[0.09 -0.48 -0.87 0.0354;
    -0.98 0.08 -.14 0.25;
    0.14 0.87 -0.46 0.48
    0 0 0 1];

T_sd2=[0.09 -0.48 -0.87 .1;
    -0.98 0.08 -.14 .1;
    0.14 0.87 -0.46 .1;
    0 0 0 1];
theta=redundancy_resolution(T_sd1,theta1)
theta=redundancy_resolution(T_sd2,theta1)
%%
clc
clear all
close all
theta1=[-.2 .3 1 -1 2 1.5 1];
T_sd1=[0.09 -0.48 -0.87 0.0354;
    -0.98 0.08 -.14 0.25;
    0.14 0.87 -0.46 0.48
    0 0 0 1];

T_sd2=[0.09 -0.48 -0.87 .1;
    -0.98 0.08 -.14 .1;
    0.14 0.87 -0.46 .1;
    0 0 0 1];

theta=DLS_inverse_kinematics(T_sd1,theta1)
theta=DLS_inverse_kinematics(T_sd2,theta1)
%%
%BONUS_SIM.m
BONUS_SIM()
