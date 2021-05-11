clc
clear all
close all


p_goal = [0;0.5;0]; %Goal for p_tip to move to (in space frame)

radius = .003; %Acceptable radius from p_goal
p_tip = [0.0;0.0;0.1]; %Ptip coordinates (last frame of the robot chain)
q = [0;0;0;0;0;0;0]; %initial theta values
[TT,~,~,~]=FK_space(q,1);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
i=0;

while norm(t-p_goal) > radius &&(i<100)
J_s = J_body(q,0);

t_skew = -1.*[0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
C = t_skew*J_s(1:3,:) + J_s(4:6,:);
d = p_goal - t;

delta_q = lsqlin(C,d,[],[],[],[],[],[]);%0*pi()-q,2*pi()-q);
q_o = q;
q = q + delta_q;
[TT,~,~,~]=FK_space(q,2);
%J_inverse_kinematics(TT(:,:,6),q_o);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
norm(t-p_goal)
i = i+1
end
%--------------------------------

