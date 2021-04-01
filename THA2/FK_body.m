function [T_b,B,B_matrix,M]=FK_body(theta,graph)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: 
% Input: 
% Output: 
% Date: 3/30/21 
% Author: Maxim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,S,~,M]=FK_space(theta,graph);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=zeros(6,length(theta));
B_matrix=zeros(4,4,length(theta));
for i = 1:length(theta)
   %for each joint, determine the screw axis
   M_inv=inv(M(:,:,end));
   R=M_inv(1:3,1:3);
   p_matrix=[    0     -M_inv(3,4)  M_inv(2,4);
              M_inv(3,4)      0     -M_inv(1,4);
             -M_inv(2,4)  M_inv(1,4)      0];
   Ad_M_inv=[R zeros(3,3);
        p_matrix*R R];
   B(:,i)=Ad_M_inv*S(:,i);
   B_matrix(:,:,i)=[  0  -B(3,i)  B(2,i) B(4,i);
                   B(3,i)   0    -B(1,i) B(5,i);
                  -B(2,i) B(1,i)    0    B(6,i);
                      0     0       0     0];
   if i==1
       T_b=expm(B_matrix(:,:,i)*theta(i));
   else
       T_b=T_b*expm(B_matrix(:,:,i)*theta(i));
   end
end
T_b=M(:,:,end)*T_b;
end