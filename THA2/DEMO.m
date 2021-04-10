clc
clear all
close all

theta=J_inverse_kinematics([1 0 0 .1;
                            0 1 0 .5;
                            0 0 1 .3;
                            0 0 0  1],[0 0 0 0 0 0])