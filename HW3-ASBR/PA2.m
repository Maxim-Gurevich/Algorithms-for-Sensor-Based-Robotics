clc
clear all
close all

%axis-angle   
    %define matrix M
for i=1:N
    alpha(i)=log(R_A(i));
    beta(i)=log(R_B(i));
    M=M+beta(i)*alpha(i)';
end

%solve for R_x
R_x=sqrt(M'*M)*M';

%solve for t_x using least squares
for i=1:N
    C(i,:)=t_A(i)-R_x*t_B(i);
    D(i,:)=eye(3)-R_A(i);
end
t_x=C/D;

%quaternion
    %Solve for R_x
    for i=1:N
        s_a=
        v_a=
        s_b=
        v_b=
        M(:,:,i)=[s_a-s_b (v_a-v_b)';
            v_a-v_b (s_a-s_b)*eye(3)+(v_a+v_b)];
    end
    V=M/U/sigma;
    y=[0 0 0 1]';
    V_4=V'*y;
    %solve for translation vector p_x
    
    
    
    
    
    