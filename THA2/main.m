%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Debugging all the subfunctions for PA 2
% Input: 
% Output: 
% Date: 3/30/21 
% Author: Zahin Nambiar,Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
close all
theta1=[0 0 0 0 0 0 0];
theta2=[-.2 .3 1 -1 1 .5 0];
theta3=[.1 .1 .1 .1];

graph=1;
[T_s1,S1,S_matrix1,M1]=FK_space(theta1,0)
[T_s2,S2,S_matrix2,M2]=FK_space(theta2,graph)
[T_s3,S3,S_matrix3,M3]=FK_space(theta3,0)
%%
%Roboplot(mode,varargin)
%%
%[T_b,B,B_matrix,M]=FK_body(theta,graph)
%%
%[J_s]=J_space(theta,graph)
%%
%[J_b]=J_body(theta,graph)
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
%theta=J_inverse_kinematics(T_sd,theta)
%%
%theta=J_transpose_kinematics(T_sd,theta)
%%
%theta=redundancy_resolution(T_sd,theta)
%%
%theta=DLS_inverse_kinematics(T_sd,theta)
%%
%BONUS_SIM.m
BONUS_SIM()
