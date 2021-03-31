function Roboplot(mode,varargin)
global tp op trajPlotter
switch mode
    case 'init' %input:display name,
        %initialize theater (canvas on which objects are plotted)
        %size=10
        tp = theaterPlot();%'XLimit',[-size size],...
        %'YLimit',[-size size],'ZLimit',[-size size]);
        op = orientationPlotter(tp,'DisplayName',varargin{1},...
        'LocalAxesLength',.1,'MarkerSize',2,...
        'FontSize',10);
        trajPlotter=trajectoryPlotter(tp,...
        'DisplayName','Screw Axis', 'Linewidth', 1,...
        'color', 'm');
    case 'frame' %input:roll,pitch,yaw,x's,y's,z's,labels
        %plot body frames
        roll=varargin{1};
        pitch=varargin{2};
        yaw=varargin{3};
        x=varargin{4};
        y=varargin{5};
        z=varargin{6};
        labels=varargin{7};           
        %labels={'0,0,0';'\theta/4';'\theta/2';...
            %'3\theta/4';'\theta'};
        positions=[x y z];
        plotOrientation(op,roll,pitch,yaw,positions,labels);
    case 'axis' %input:point_x,point_y,point_z,...
                        %axis_x,axis_y,axis_z
        axispoints=zeros(100,3);
        interval=.1;
        p_xyz=[varargin{1} varargin{2} varargin{3}];
        a_xyz=[varargin{4} varargin{5} varargin{6}];
        for i=1:100
            newpoint=(p_xyz+a_xyz*interval*i);
            axispoints(i,:)=newpoint;
        end
        axis_points_cell_array={axispoints};
        plotTrajectory(trajPlotter,axis_points_cell_array);
    case 'points' %input:x's,y's,z's
        x=varargin{1};
        y=varargin{2};
        z=varargin{3};
        points={[x,y,z]};
        plotTrajectory(trajPlotter,points);
    otherwise
        error('invalid input for "mode"')
end
end