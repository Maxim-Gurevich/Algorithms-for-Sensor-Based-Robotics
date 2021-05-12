clc
clear all
close all

p_goal = [0;0.4;0.1]; %Goal for p_tip to move to (in space frame)
radius = .001; %Acceptable radius from p_goal
p_tip = [0.0;0;0.1]; %Ptip coordinates (last frame of the robot chain)
q = redundancy_resolution([eye(3) p_goal+.1;0 0 0 1],...
    [2 2.5 -1.7 -1.5 0.3 -1.5 -2.4])
%q = [0;0;0;0;0;0;0];
%[-2.5;0;-.5;1.5;-1.25;1;1];
qmin=-5;
qmax=5;
[TT,~,~,~]=FK_space(q,1);
[Tb,~,~,~]=FK_body(q,0);

t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);

i=0;
while (norm(t-p_goal) > radius)&&(i<100)
J_s = J_space(q,0);
J_b = J_body(q,0);
R=Tb(1:3,1:3,1);
Rz=R*[0;0;1];
t_skew = [0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
Rz_skew=[0 -Rz(3) Rz(2); -Rz(3) 0 -Rz(1); -Rz(2) Rz(1) 0];
C = [1*(-t_skew*J_b(1:3,:) + J_b(4:6,:));
    1*(-Rz_skew*J_b(1:3,:))];
d = [p_goal-t;0;0;0];
% A=[cos(u1i) cos(u1i) cos(u1i) sin(u1i) sin(u1i) 0 0 0;
%     ];
A = 1*(-t_skew*J_b(1:3,:) + J_b(4:6,:));
w=[.03;.03;.03];
delta_q = lsqlin(C,d,A,w,[],[],[],[]);
     %[-pi -pi/4 -pi -pi -pi -pi -2*pi]'-q,...
     %[pi pi pi/3 0 pi pi 0]'-q);
options.Display = 'iter';
q = q + delta_q;
pause(.1);
[TT,~,~,~]=FK_space(q,2);
[Tb,~,~,~]=FK_body(q,0);
t = TT(:,:,7)*[p_tip;1];
t = t(1:3,:);
norm(t-p_goal)
i=i+1
end

