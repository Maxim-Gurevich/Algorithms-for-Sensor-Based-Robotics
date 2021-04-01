function theta=redundancy_resolution(T_sd,theta)
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

%theta=[0;0;0;0;0;0;.2];
FK_body(theta,1);%to initiate graph
%[J_b]=J_body(theta,0);
%T_sd=M(:,:,end)
i=0;
omega_b=[10 10 10];
v_b=[10 10 10];
eps_omega=.001;
eps_v=.001;
mem_w=0;
mem_q=0;
k=1;
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<100
    J_b=FK_body(theta,2);
    V_b_matrix=logm(inv(J_b)*T_sd);
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
    V_b=[v_b; omega_b];
    qdot_0=k*transpose((sqrt(det(J_b*transpose(J_b)))-mem_w)/theta-mem_q);
    mem_w=sqrt(det(J_b*transpose(J_b)));
    mem_q=theta;
    theta=theta+pinv(J_b)*V_b+(eye(7)-pinv(J_b)*J_b)*qdot_0;
    
    i=i+1;
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
end
if i==100
    error('theta could not converge')
end
end