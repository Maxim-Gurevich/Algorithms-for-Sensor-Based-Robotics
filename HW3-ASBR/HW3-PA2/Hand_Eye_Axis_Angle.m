function [R_x,t_x]=Hand_Eye_Axis_Angle(q_Robot_config,...
    q_camera_config,t_Robot_config,t_camera_config,num)

    %define matrix M
    M=zeros(3);
    for i=1:num
        R_A=Quat2RotMat(q_Robot_config(i,:));
        R_B=Quat2RotMat(q_camera_config(i,:));
        alpha=logm(R_A);
        beta=logm(R_B);
        M=M+(beta*alpha.');
        %M(3*(i-1)+1:3*(i-1)+3,:)=beta*alpha.'
    end

    %solve for R_x using eigen decomposition
    [Q,D]=eig(M.'*M);
    sqD=[1/sqrt(D(1,1)) 0 0;0 1/sqrt(D(2,2)) 0;0 0 1/sqrt(D(3,3))];
    R_x=Q*sqD/Q*M.';

    %solve for t_x using least squares
    for i=1:num
        t_A=t_Robot_config(i,:).';
        t_B=t_camera_config(i,:).';
        R_A=Quat2RotMat(q_Robot_config(i,:));
        E(3*(i-1)+1:3*(i-1)+3,:)=R_x*t_B-t_A;
        F(3*(i-1)+1:3*(i-1)+3,:)=R_A-eye(3);
    end
    t_x=pinv(F)*E;
end