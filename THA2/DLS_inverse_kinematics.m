function theta=DLS_inverse_kinematics(T_sd,theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Using the derived forward kinematics and Jacobians,uses the
% iterative numerical inverse kinematics algorithm to control the robot
% from arbitrary configuration a to desired configuration b.
% Input: theta, T_sd
% Output: theta
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%theta=[0;0;0;0;0;0;.2];
FK_body(theta,1);%to initiate graph
%[J_b]=J_body(theta,0);
%T_sd=M(:,:,end)

i=0;
omega_b=[10 10 10];
v_b=[10 10 10];
eps_omega=.001;
eps_v=.001;
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<20
    J_b=FK_body(theta,2);
    V_b_matrix=logm(inv(J_b)*T_sd);
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
    V_b=[v_b; omega_b];
    theta=theta+(transpose(J_b)*inv(J_b*transpose(J_b)+damping^2*eye(7))*V_b;
    i=i+1;
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
end
if i==20
    error('theta could not converge')
end
end