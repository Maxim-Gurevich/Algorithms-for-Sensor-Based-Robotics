function [outputArg1,outputArg2] = Question_3(screw,theta,Tinit)
%QUESTION_3 Summary of this function goes here
%   Detailed explanation goes here

[config_1,config_2,config_3,config_4] = ...
    configuration_cal(screw,theta,Tinit);
[S, theta2] = TMatrix2ScrewAngle(config_4);

tp = theaterPlot();
op = orientationPlotter(tp,'DisplayName','Fused Data',...
    'LocalAxesLength',2);
    plotOrientation(op, [config_1;config_2;config_3;config_4])
end

