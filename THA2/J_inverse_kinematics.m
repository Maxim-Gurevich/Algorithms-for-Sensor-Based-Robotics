clc
clear all

%Using the derived forward kinematics and Jacobians,...
%uses the iterative numerical inverse kinematics algorithm...
%to control the robot from arbitrary configuration a to...
%desired configuration b.
theta=[0;0;0;0;0;1]
[T_sb,B,B_matrix,M]=FK_body(theta)
T_sd=M
i=0;
omega_b=[10 10 10]
v_b=[10 10 10]
eps_omega=.001
eps_v=.001
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<100
    V_b_matrix=logm(inv(FK_space(theta))*T_sd)
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)]
    omega_b=V_b_matrix(1:3,4)
    V_b=[v_b; omega_b]
    theta=theta+pinv(J_space(theta))*V_b
    i=i+1
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)]
    omega_b=V_b_matrix(1:3,4)
end
