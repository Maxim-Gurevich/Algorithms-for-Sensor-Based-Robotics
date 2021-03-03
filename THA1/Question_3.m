function [outputArg1,outputArg2] = Question_3(q,s_hat,h,theta,T)
%QUESTION_3 Summary of this function goes here
%   Detailed explanation goes here

screw=[0 -screwin(3) screwin(2) ;
       screwin(3) 0 -screwin(1);
       -screwin(2) screwin(1) 0];
[config_1,config_2,config_3,config_4] = ...
    configuration_calculator(screw,theta,Tinit);
[S, theta2] = TMatrix2ScrewAngle(config_4);

tp = theaterPlot();
op = orientationPlotter(tp,'DisplayName','Data',...
    'LocalAxesLength',2);
    plotOrientation(op, [config_1;config_2;config_3;config_4])
end