function [T_b,B,B_matrix,M]=FK_body(theta)
[~,S,~,M]=FK_space(theta);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=zeros(length(theta),6);
B_matrix=zeros(4,4,length(theta));
for i = 1:length(theta)
   %for each joint, determine the screw axis
   M_inv=inv(M);
   R=M_inv(1:3,1:3);
   p_matrix=[    0     -M_inv(3,4)  M_inv(2,4);
              M_inv(3,4)      0     -M_inv(1,4);
             -M_inv(2,4)  M_inv(1,4)      0];
   Ad_M_inv=[R zeros(3,3);
        p_matrix*R R];
   B(:,i)=Ad_M_inv*S(:,i);
   B_matrix(:,:,i)=[  0  -B(i,3)  B(i,2) B(1,4);
                   B(i,3)   0    -B(i,1) B(2,4);
                  -B(i,2) B(i,1)    0    B(3,4);
                      0     0       0     0];
   if i==1
       T_b=expm(B_matrix(:,:,i)*theta(i));
   else
       T_b=T_b*expm(B_matrix(:,:,i)*theta(i));
   end
end
T_b=M*T_b;
end