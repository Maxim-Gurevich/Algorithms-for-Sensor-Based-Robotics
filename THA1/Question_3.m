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

%W4-L1: The Screw Interpertation of a Twist
%omega=s_hat;
%v=cross(-s_hat,q)+h.*s_hat;
%screw=[0 -omega(3) omega(2) v(1);
%    omega(3) 0 -omega(1) v(2);
%    -omega(2) omega(1) 0 v(3);
%    0 0 0 0];


[config_1,config_2,config_3,config_4] = ...
    configuration_calculator(screw,theta,Tinit);

[S, theta2] = TMatrix2ScrewAngle(config_4);

[q,s,h] = screw2qsh(S)

axispoints=zeros(50,3);
interval=.1;
for i=1:50
    newpoint=q+s*interval*i;
    axispoints(i,:)=newpoint;
end
axis_points_cell_array={axispoints}
%initialize theater
tp = theaterPlot();%'XLimit',[-size size],...
    %'YLimit',[-size size],'ZLimit',[-size size]);
    
%plot body frames    
op = orientationPlotter(tp,'DisplayName','Data',...
    'LocalAxesLength',2,'MarkerSize',2);
orientations=cat(3,config_1(1:3,1:3),...
    config_2(1:3,1:3),config_3(1:3,1:3),...
    config_4(1:3,1:3));%S(1:3,1:3));
positions=[transpose(config_1(1:3,4));...
    transpose(config_2(1:3,4));...
    transpose(config_3(1:3,4));...
    transpose(config_4(1:3,4))];%...
%    transpose(S(1:3,4))];
plotOrientation(op,orientations,positions);

%plot screw axis
trajPlotter=trajectoryPlotter(tp,...
    'DisplayName','Screw Axis', 'Linewidth', 1,...
    'color', 'm');
plotTrajectory(trajPlotter,axis_points_cell_array);




