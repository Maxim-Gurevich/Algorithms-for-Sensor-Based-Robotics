%calculate the space Jacobian of robot
clc
clear all
theta=[0 0 0 0 0 0];
[T,S,S_matrix,M]=FK_space(theta);


J_s=zeros(length(theta),6);
J_s(:,1)=S(:,1);
term=1;
for i=2:length(theta)
    for j=1:i-1
        term=term*exp(S_matrix(:,:,i)*theta(i));
    end
    J_s(i)=adjoint(term)*S(:,i);
end