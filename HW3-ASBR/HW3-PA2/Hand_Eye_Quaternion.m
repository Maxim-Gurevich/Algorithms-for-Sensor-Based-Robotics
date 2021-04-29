function [R_x,t_x]=Hand_Eye_Quaternion(q_Robot_config,...
    q_camera_config,t_Robot_config,t_camera_config,num)

    %Solve for R_x
    clear M
    for i=1:num
        s_a=q_Robot_config(i,1);
        v_a=q_Robot_config(i,2:4);
        s_b=q_camera_config(i,1);
        v_b=q_camera_config(i,2:4);
        vec=v_a+v_b;
        skew=[0   -vec(3) vec(2);
            vec(3)  0    -vec(1);
           -vec(2) vec(1)   0];
        M(4*(i-1)+1,1)=s_a-s_b;
        M(4*(i-1)+1,2:4)=-(v_a-v_b).';
        M(4*(i-1)+2:4*(i-1)+4,1)=v_a-v_b;
        M(4*(i-1)+2:4*(i-1)+4,2:4)=(s_a-s_b)*eye(3)+skew;
    end
    [~,~,V]=svd(M);
    y=[0;0;0;1];
    q_x=V*y;

    %solve for translation vector t_x
    R_x=Quat2RotMat(q_x);
    for i=1:num
        R_A=Quat2RotMat(q_Robot_config(i,:));
        p_a=t_Robot_config(i,:).';
        p_b=t_camera_config(i,:).';
        E(3*(i-1)+1:3*(i-1)+3,:)=R_x*p_b-p_a;
        F(3*(i-1)+1:3*(i-1)+3,:)=R_A-eye(3);
    end
    t_x=pinv(F)*E;
end
