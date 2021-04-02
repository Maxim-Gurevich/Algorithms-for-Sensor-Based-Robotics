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
[T,B1,B_matrix,M]=FK_body(theta,1);%to initiate graph
%[J_b]=J_body(theta,0);
%T_sd=M(:,:,end)

i=0;
damping=1;
omega_b=[10 10 10];
v_b=[10 10 10];
eps_omega=.0001;
eps_v=.0001;
theta=transpose(theta);
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<20
    [T,~,~,~]=FK_body(theta,0);
    J_b=J_body(theta,2);
    T_bd=inv(T)*T_sd;
    V_b_matrix=logm(T_bd);
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
    V_b=[v_b; omega_b];
    theta=theta+transpose(J_b)*inv(J_b*transpose(J_b)+damping^2*eye(6))*V_b;
    i=i+1
end
if i==100
    error('theta could not converge')
end
end