clc
clear all
close all

%axis-angle   
    %define matrix M
for i=1:N
    alpha(i)=log(R_A(i));
    beta(i)=log(R_B(i));
    M=M+beta(i)*alpha(i)'
end

%solve for R_x
R_x=sqrt(M'*M)*M';

%solve for t_x using least squares
C=
D=
t_x=C/D;
%quaternion
    %Solve for R_x
    %solve for translation vector p_x