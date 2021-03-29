%calculate the space Jacobian of robot
clc
clear all
theta=[0 0 0 0 0 0];
T=FK_space(theta);


J_s=zeros(size(theta),6);
J_s(1)=S(1);
term=1;
for i=2:size(theta,6)
    for j=1:i-1
        term=term*exp(S(i)*theta(i));
    end
    J_s(i)=adjoint(term)*S(i);
end