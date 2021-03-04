%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Plotting screw operation
% Settable parameters: q(3x1),s(3x1),h,theta(Radians),Tinit(4x4)
% Output: Plotting of configurations and screw axis from last config to
% origin
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Question_3(q,s_hat,h,theta,Tinit)

screw=qsh2screw(q,s_hat,h);


[config_1,config_2,config_3,config_4] = ...
    configuration_calculator(screw,theta,Tinit);

[S, theta2] = TMatrix2ScrewAngle(config_4);

[q,s,h] = screw2qsh(S);

%generate points along screw axis (for plotting)
axispoints=zeros(100,3);
interval=.1;

for i=1:100
    newpoint=transpose(q+s*interval*i);
    axispoints(i,:)=newpoint;
end
axis_points_cell_array={axispoints};

%initialize theater (canvas on which objects are plotted)
%size=10
tp = theaterPlot();%'XLimit',[-size size],...
    %'YLimit',[-size size],'ZLimit',[-size size]);
    
%plot body frames    
op = orientationPlotter(tp,'DisplayName','Data',...
    'LocalAxesLength',2,'MarkerSize',2,...
    'FontSize',10);
orientations=cat(3,zeros(3,3),config_1(1:3,1:3),...
    config_2(1:3,1:3),config_3(1:3,1:3),...
    config_4(1:3,1:3));
positions=[zeros(1,3);transpose(config_1(1:3,4));...
    transpose(config_2(1:3,4));...
    transpose(config_3(1:3,4));...
    transpose(config_4(1:3,4))];
labels={'0,0,0';'\theta/4';'\theta/2';'3\theta/4';'\theta'};
plotOrientation(op,orientations,positions,labels);

%plot screw axis
trajPlotter=trajectoryPlotter(tp,...
    'DisplayName','Screw Axis', 'Linewidth', 1,...
    'color', 'm');
plotTrajectory(trajPlotter,axis_points_cell_array);




