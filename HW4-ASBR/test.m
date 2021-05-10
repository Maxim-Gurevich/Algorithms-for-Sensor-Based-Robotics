clc
clear all
close all

T=[1 0 0 .1;
    0 1 0 .5;
    0 0 1 .1;
    0 0 0  1];
starting_angles=[0 0 0 0 0 0 0];

theta_red=redundancy_resolution(T,starting_angles);