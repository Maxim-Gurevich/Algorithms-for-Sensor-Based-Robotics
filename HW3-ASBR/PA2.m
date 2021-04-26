clc
clear all
close all

%axis-angle method   
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

%quaternion method
    %Solve for R_x
    for i=1:N
        s_a=q_a(1);
        v_a=q_a(2:4);
        s_b=q_b(1);
        v_b=q_b(2:4);
        vec=v_a+v_b;
        skew=[0 -vec(3) vec(2);
            vec(3) 0 -vec(1);
            -vec(2) vec(1) 0];
        M(:,:,i)=[s_a-s_b (v_a-v_b)';
            v_a-v_b (s_a-s_b)*eye(3)+skew];
    end
    [U,S,V]=svd(M);
    y=[0;0;0;1];
    R_x=V'*y;%needs conversion to matrix (this is a quaternion)?
    
    %solve for translation vector p_x
    %least squares -- A'*A*x=A'*b
    R_ak=
    p_ak=
    p_bk=
    
    ATA=(R_ak-eye(3))'*(R_ak-eye(3));
    ATb=(R_ak-eye(3))*(R_x*p_bk-p_ak);
    p_x=ATb/ATA;
    
    
    
    
    
    