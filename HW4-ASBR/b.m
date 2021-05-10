clc
clear all
close all

p_goal = [0;0.5;0]; %Goal for p_tip to move to (in space frame)
radius = .01; %Acceptable radius from p_goal
p_tip = [0.0;0.0;0.1]; %Ptip coordinates (last frame of the robot chain)
q = [-2.5;0;-.5;1.5;-1.25;1;1];
qmin=-5;
qmax=5;
[TT,~,~,~]=FK_space(q,1);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);

i=0;
while (norm(t-p_goal) > radius)&&(i<100)
J_s = J_space(q,0);
R=TT(1:3,1:3,7);
t_skew = -1.*[0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
Rz_skew=[0 -R(3,3) R(2,3); -R(3,3) 0 -R(1,3); -R(2,3) R(1,3) 0];
C = t_skew*J_s(1:3,:) + J_s(4:6,:);%+100*(-Rz_skew*J_s(4:6,:));
d = p_goal - t;
% A=[cos(u1i) cos(u1i) cos(u1i) sin(u1i) sin(u1i) 0 0 0;
%     ];
w=100*ones(3,1);
delta_q = lsqlin(C,d,[],[],[],[],-.001,.001);
q = q + delta_q;
[TT,~,~,~]=FK_space(q,2);
t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
%Roboplot('points',t)
norm(t-p_goal);
i=i+1
end

