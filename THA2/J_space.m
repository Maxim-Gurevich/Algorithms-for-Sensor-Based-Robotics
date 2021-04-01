function [J_s]=J_space(theta)
%calculate the space Jacobian of robot
%theta=[0 0 0 0 0 0];
[~,S,S_matrix,~]=FK_space(theta,0);

J_s=zeros(6,length(theta));
J_s(:,1)=S(:,1);
for i=2:length(theta)
    term=1;
    for j=1:i-1
        term=term*expm(S_matrix(:,:,i)*theta(i));
    end
    R=term(1:3,1:3);
    p_matrix=[    0     -term(3,4)  term(2,4);
              term(3,4)      0     -term(1,4);
             -term(2,4)  term(1,4)      0];
    Ad_term=[R zeros(3,3);
        p_matrix*R R];
    J_s(:,i)=Ad_term*S(:,i);
end
end