clc
clear all

%Using the derived forward kinematics and Jacobians,...
%uses the iterative numerical inverse kinematics algorithm...
%to control the robot from arbitrary configuration a to...
%desired configuration b.
theta=[0 0 0 0 0 0]
[T_sb,S,S_matrix,M]=FK_space(theta)
T_sd=[1 0 0 -200;
     0 1 0 -200;
     0 0 1 0;
     0 0 0 1]

i=0;
omega_b=[10 10 10]
v_b=[10 10 10]
eps_omega=1
eps_v=1
while norm(omega_b)>eps_omega || norm(v_b) > eps_v || i>100
    V_b_matrix=log(inv(FK_space(theta))*T_sd)
    v_b=[V_b_matrix(3,2) V_b_matrix(1,3) V_b_matrix(2,1)]
    omega_b=V_b_matrix(4,[1:3])
    V_b=transpose([v_b omega_b])
    theta=theta+pinv(J_space(theta))*V_b
    i=i+1
    v_b=[V_b_matrix(3,2) V_b_matrix(1,3) V_b_matrix(2,1)]
    omega_b=V_b_matrix(4,[1:3])
end
