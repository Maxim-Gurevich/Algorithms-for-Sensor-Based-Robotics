clc
clear all
close all

T=[1 0 0 .1;
    0 1 0 .5;
    0 0 1 .1;
    0 0 0  1];
starting_angles=[.5 .5 .5 .5 .5 .5 .5];

theta_inv=J_inverse_kinematics(T,starting_angles);

theta_tra=J_transpose_kinematics(T,starting_angles);

theta_red=redundancy_resolution(T,starting_angles);

theta_dls=DLS_inverse_kinematics(T,starting_angles);