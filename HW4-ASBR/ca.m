clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: uses lsqlin to move robot to point given 2 contraints
% (joints and plane boundary)
% Input: update p_start,p_goal,plane_point, plane_normal
% Output: Simulation of arm from p_tip to p_goal (3mm of goal) given joint contsraint
% and plane boundary.
% Date: 5/13/21
% Author: Maxim+Zahin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p_goal = [0.2;0.4;0.3];%Goal for p_tip to move to (in space frame)
p_tip = [0;0;0.1]; %Ptip coordinates (last frame of the robot chain)
p_start = [0.2;0.4;0.7]-p_tip;
plane_point=[0 0 0];
plane_normal=[0 0 -1];
radius = .003; %Acceptable radius from p_goal
q = redundancy_resolution([eye(3) p_start;0 0 0 1],...
    [2 2.5 -1.7 -1.5 0.3 -1.5 -2.4]);
[TT,~,~,~]=FK_space(q,1);
limits=[-pi -pi/4 -pi -pi -pi -pi -2*pi;
    pi 2*pi pi/3 0 pi pi 0];
%plot plane
patch([.1 -.1 -.1 .1], [.1 .1 -.1 -.1],...
    [0 0 0 0],[0 0 0 0])

[Tb,~,~,~]=FK_body(q,0);
t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
plane_dist=plane_normal*(t-plane_point');
i=1;
tplot(:,i)=t;
while (norm(t-p_goal) > radius)&&(i<100)
    J_s = J_space(q,0);
    J_b = J_body(q,0);
    R=Tb(1:3,1:3,1);
    Rz=R*[0;0;1];
    
    t_skew = [0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
    Rz_skew=[0 -Rz(3) Rz(2); -Rz(3) 0 -Rz(1); -Rz(2) Rz(1) 0];
    C = 1*(-t_skew*J_b(1:3,:) + J_b(4:6,:));
    d=p_goal-t;
    A=plane_normal*J_b(4:6,:);
    w=plane_normal*(plane_point-t')';
    qmin=limits(1,:)'-q;
    qmax=limits(2,:)'-q;
    delta_q = lsqlin(C,d,A,w,[],[],qmin,qmax);
    A*delta_q-w
    q = q + delta_q;
    pause(.1);
    [TT,~,~,~]=FK_space(q,2);
    [Tb,~,~,~]=FK_body(q,0);
    t = TT(:,:,7)*[p_tip;1];
    t = t(1:3,:);
    norm(t-p_goal)
    plane_dist=plane_normal*(t-plane_point');
    i=i+1
    tplot(:,i)=t;hold on
    plot3(tplot(1,:),tplot(2,:),tplot(3,:),'r')
    hold off
end
