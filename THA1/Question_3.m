function [outputArg1,outputArg2] = Question_3(q,s_hat,h,theta,T)

% type this into command line to run: 
% Question_3([0 2 0],[0 0 1], 2, pi,[1 0 0 2;0 1 0 0; 0 0 1 0;0 0 0 1])

% QUESTION_3 Summary of this function goes here
%   Detailed explanation goes here

screw=[s_hat;cross(-s_hat,q)+h.*s_hat];
[config_1,config_2,config_3,config_4] = ...
    configuration_calculator(screw,theta,Tinit);
[S, theta2] = TMatrix2ScrewAngle(config_4);

tp = theaterPlot();
op = orientationPlotter(tp,'DisplayName','Data',...
    'LocalAxesLength',2);
    plotOrientation(op, [config_1;config_2;config_3;config_4])
end