function [J_b]=J_body(theta,graph)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculate the body Jacobian of robot
% Input: Theta, graph mode(0-no plot,1-newplot,...
                        %or 2-add to plot)
% Output: J_b 6xn, plot
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%theta=[0 0 0 0 0 0];
[~,B,B_matrix,~]=FK_body(theta,graph);

n=length(theta);
J_b=zeros(6,n);
J_b(:,n)=B(:,n);
for i=1:n-1
    term=1;
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