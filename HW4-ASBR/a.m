clc
clear all
close all

p_goal = [1.0;1.0;1.0];
radius = .03;
p_tip = [0.0;0.0;0.1];
q = [.5;.5;.5;.5;.5;.5]; %initial theta values
[TT,~,~,~]=FK_space(q,0);

t = TT(:,:,6)*[p_tip;1];
t = t(1:3,:);
%while loop-------------------
J_s = J_space(q,0);
t_skew = -1.*[0 -t(3) t(2); t(3) 0 -t(1); -t(2) t(1) 0];
C = t_skew*J_s(1:3,:) + J_s(4:6,:);
d = p_goal - t;

delta_q = lsqlin(C,d,[],[],[],[],-2*pi()-q,2*pi()-q);
q = q + delta_q
[TT,~,~,~]=FK_space(q,0);
t = TT(:,:,6)*[p_tip;1];
t = t(1:3,:);
%--------------------------------