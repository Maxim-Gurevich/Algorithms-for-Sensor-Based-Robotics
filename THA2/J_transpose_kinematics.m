function theta=J_transpose_kinematics(T_sd,theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Using the derived forward kinematics and Jacobians,
%uses the iterative numerical inverse kinematics algorithm
%to control the robot from arbitrary configuration a to
%desired configuration b.
% Input: 
% Output: 
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%theta=[0;0;0;0;0;0;.1];
FK_body(theta,1);%to initiate graph
[J_b]=J_body(theta);
%T_sd=M(:,:,end);
constant=.5;
i=0;
omega_b=[10 10 10];
v_b=[10 10 10];
eps_omega=.01;
eps_v=.01;
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<100
    V_b_matrix=logm(inv(FK_body(theta,2))*T_sd);
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
    V_b=[v_b; omega_b];
    theta=theta+constant*transpose(J_b)*V_b;
    i=i+1;
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
end
if i==100
    error('theta could not converge')
end
end





