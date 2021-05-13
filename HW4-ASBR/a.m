function []=a(p_start,p_goal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: uses lsqlin to move robot to point given 1 contraint
% (joint angles)
% Input: p_start,p_goal
% Output: Simulation of arm from p_tip to p_goal (3mm of goal) given joint contsraint
% Date: 5/13/21
% Author: Maxim+Zahin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%p_goal = [0;0.5;0]; %Goal for p_tip to move to (in space frame)
radius = .0001; %Acceptable radius from p_goal
p_tip = [0.0;0.0;0.1]; %Ptip coordinates (last frame of the robot chain)
p_start = p_start-p_tip;
q = redundancy_resolution([eye(3) p_start;0 0 0 1],...
    [2 2.5 -1.7 -1.5 0.3 -1.5 -2.4]);
%q = [0;0;0;0;0;0;0]; %initial theta values
limits=[-pi -pi/4 -pi -pi -pi -pi -2*pi;
    pi 2*pi pi/3 0 pi pi 0];
[TT,~,~,~]=FK_space(q,1);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
i=0;

while norm(t-p_goal) > radius &&(i<100)
J_b = J_body(q,0);

t_skew = -1.*[0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
C = t_skew*J_b(1:3,:) + J_b(4:6,:);
d = p_goal - t;
qmin=limits(1,:)'-q;
qmax=limits(2,:)'-q;
delta_q = lsqlin(C,d,[],[],[],[],[],[]);%...
%    (-2*pi-q),(2*pi-q));
q = q + delta_q
[TT,~,~,~]=FK_space(q,2);
%J_inverse_kinematics(TT(:,:,6),q_o);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
error=norm(t-p_goal)
i=i+1;
iterations=i
end
end
