function [J_b]=J_body(theta)
%calculate the body Jacobian of robot
%theta=[0 0 0 0 0 0];
[~,B,B_matrix,~]=FK_body(theta);

J_b=zeros(6,length(theta));
J_b(:,1)=B(:,1);
term=1;
n=length(theta);
for i=1:n
    for j=i+1:n
        term=expm(-1*B_matrix(:,:,j)*theta(j))*term;
    end
    R=term(1:3,1:3);
    p_matrix=[    0     -term(3,4)  term(2,4);
              term(3,4)      0     -term(1,4);
             -term(2,4)  term(1,4)      0];
    Ad_term=[    R      zeros(3,3);
             p_matrix*R      R];
    J_b(:,i)=Ad_term*B(:,i);
end
end