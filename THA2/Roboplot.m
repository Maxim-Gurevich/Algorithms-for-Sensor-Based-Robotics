%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Plotter
% Input: plot mode followed by additional data (specific to mode)
% Output: new plot or new features inside exsisting plot
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Roboplot(mode,varargin)
global tp op trajPlotter
switch mode
    case 'init' %input:display name,
        %initialize theater (canvas on which objects are plotted)
        size=.5;
        tp = theaterPlot('XLimit',[-.1 .5],...
        'YLimit',[-.1 .6],'ZLimit',[-.1 .8]);
        op = orientationPlotter(tp,'DisplayName',varargin{1},...
        'LocalAxesLength',.1,'MarkerSize',2,...
        'FontSize',10);
        trajPlotter=trajectoryPlotter(tp,...
        'DisplayName','Ellipsoid Axes', 'Linewidth', 1,...
        'color', 'm');
    case 'frames' %input:orientations,positions,labels
        %plot body frames
        orientations=varargin{1};
        positions=varargin{2};
        labels=varargin{3};           
        %labels={'0,0,0';'\theta/4';'\theta/2';...
            %'3\theta/4';'\theta'};
        plotOrientation(op,orientations,positions,labels);
    case 'points' %input:orientations,positions,labels
        plotTrajectory(trajPlotter,varargin{1})
    otherwise
        error('invalid input for "mode"')
end
end