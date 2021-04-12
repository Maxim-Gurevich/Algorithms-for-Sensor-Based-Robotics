function theta=redundancy_resolution(T_sd,theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Using the derived forward kinematics and Jacobians,
%uses the iterative numerical inverse kinematics algorithm
%to control the robot from arbitrary configuration a to
%desired configuration b. Also considers secondary objective function.
% Input: target configuration, current theta
% Output: plot, new configuration, and final theta
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%theta=[0;0;0;0;0;0;.2];
[T,B1,B_matrix,M]=FK_body(theta,1);%to initiate graph
%[J_b]=J_body(theta,0);
%T_sd=M(:,:,end)
i=0;
omega_b=[10 10 10];
v_b=[10 10 10];
eps_omega=.0001;
eps_v=.0001;
mem_w=0;
mem_q=0;
k=1;
theta=transpose(theta);
while (norm(omega_b)>eps_omega || norm(v_b) > eps_v) && i<100
    [T,~,~,~]=FK_body(theta,0);
    pause(.3);
    J_b=J_body(theta,2);
    
    %elipsoid calculation
    [length,vec_dir] = ellipsoid_plot_linear(J_b);
    ellipsoid_x = [];
    ellipsoid_y = [];
    ellipsoid_z = [];
    scale=.5;
    for z = 1:3
        ellipsoid_x(end+1) = vec_dir(1,z)*length(z)*scale;
        ellipsoid_y(end+1) = vec_dir(2,z)*length(z)*scale;
        ellipsoid_z(end+1) = vec_dir(3,z)*length(z)*scale;
        
        ellipsoid_x(end+1) = vec_dir(1,z)*-1*length(z)*scale;
        ellipsoid_y(end+1) = vec_dir(2,z)*-1*length(z)*scale;
        ellipsoid_z(end+1) = vec_dir(3,z)*-1*length(z)*scale;
    end
    s_points=[ellipsoid_x;ellipsoid_y;ellipsoid_z;1 1 1 1 1 1];
    %create three rings to show elipse
    line_1 = [];
    line_2 = [];
    line_3 = [];
    for k=1:6
        new_point=T*s_points(:,k);
        if k<=2
            line_1(1:3,end+1)=new_point(1:3);
        elseif k<=4
            line_2(1:3,end+1)=new_point(1:3);
        else
            line_3(1:3,end+1)=new_point(1:3);
        end
    end
    Roboplot('points', {line_1.',line_2.',line_3.'})
    T_bd=inv(T)*T_sd;
    V_b_matrix=logm(T_bd);
    v_b=[V_b_matrix(3,2); V_b_matrix(1,3); V_b_matrix(2,1)];
    omega_b=V_b_matrix(1:3,4);
    V_b=[v_b; omega_b];
    qdot_0=k*transpose((sqrt(det(J_b*transpose(J_b)))-mem_w)/(theta-mem_q));
    mem_w=sqrt(det(J_b*transpose(J_b)));
    mem_q=theta;
    theta=theta+pinv(J_b)*V_b+(eye(7)-pinv(J_b)*J_b)*qdot_0;
    i=i+1
end
if i==100
    error('theta could not converge')
end
end