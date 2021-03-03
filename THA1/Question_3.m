% QUESTION_3 Summary of this function goes here
%   Detailed explanation goes here

%function [outputArg1,outputArg2] = Question_3(q,s_hat,h,theta,Tinit)

close all
clc
clear all


q=[0 2 0];
s_hat=[0 0 1];
h=2;
theta=pi;
Tinit=[1 0 0 2;0 1 0 0; 0 0 1 0;0 0 0 1];

[screw,v]=qsh2screw(q,s_hat,2);

[config_1,config_2,config_3,config_4] = ...
    configuration_calculator(screw,theta,Tinit);

[S, theta2] = TMatrix2ScrewAngle(config_4);

[orientation,valid]=quaternion_func(config_4(1:3,1:3));

%plot
%size=10;
tp = theaterPlot()%'XLimit',[-size size],...
    %'YLimit',[-size size],'ZLimit',[-size size]);
op = orientationPlotter(tp,'DisplayName','Data',...
    'LocalAxesLength',2,'MarkerSize',2);

orientations=cat(3,config_1(1:3,1:3),...
    config_2(1:3,1:3),config_3(1:3,1:3),...
    config_4(1:3,1:3));

positions=[transpose(config_1(1:3,4));...
    transpose(config_2(1:3,4));...
    transpose(config_3(1:3,4));...
    transpose(config_4(1:3,4))];

plotOrientation(op,orientations,positions);





