%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: uses lsqlin to move probot to point
% Input:
% Output:
% Date:
% Author: Maxim+Zahin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function []=a(p_goal, p_start)
%p_goal = [0;0.5;0]; %Goal for p_tip to move to (in space frame)
radius = .0001; %Acceptable radius from p_goal
p_tip = [0.0;0.0;0.1]; %Ptip coordinates (last frame of the robot chain)
%p_start = [0.2;0.4;0.299]-p_tip;
q = redundancy_resolution([eye(3) p_start;0 0 0 1],...
    [2 2.5 -1.7 -1.5 0.3 -1.5 -2.4]);
%q = [0;0;0;0;0;0;0]; %initial theta values
[TT,~,~,~]=FK_space(q,1);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
i=0;

while norm(t-p_goal) > radius &&(i<100)
J_b = J_body(q,0);

t_skew = -1.*[0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
C = t_skew*J_b(1:3,:) + J_b(4:6,:);
d = p_goal - t;
delta_q = lsqlin(C,d,[],[],[],[],[],[]);%...
%    (-2*pi-q),(2*pi-q));
q = q + delta_q;
[TT,~,~,~]=FK_space(q,2);
%J_inverse_kinematics(TT(:,:,6),q_o);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
norm(t-p_goal)
i = i+1
end
end

