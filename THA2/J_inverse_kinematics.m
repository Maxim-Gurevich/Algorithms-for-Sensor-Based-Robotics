clc
clear all

%Using the derived forward kinematics and Jacobians,...
%uses the iterative numerical inverse kinematics algorithm...
%to control the robot from arbitrary configuration a to...
%desired configuration b.
theta=[0 0 0 0 0 0];
[T_sb,S,S_matrix,M]=FK_space(theta);
T_sd=[0 0 0 0;
     0 0 0 0;
     0 0 0 0;
     0 0 0 0];

i=0;
eps_omega=1;
eps_v=1;
omega_b=5;
v_b=5;
V_b=[1;1;1;1;1;1];
while abs(omega_b)>eps_omega || abs(v_b) > eps_v || i>100
V_b_matrix=log(inv(FK_space(theta))*T_sd)
theta=theta+pinv(J_space(theta))*V_b
i=i+1;
omega_b=1;
v_b=1;
end
