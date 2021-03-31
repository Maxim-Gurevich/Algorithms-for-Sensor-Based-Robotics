function [T,B,B_matrix,M]=FK_body(theta)
[T,B,B_matrix,M]=FK_space(theta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B=zeros(length(theta),6);
B_matrix=zeros(4,4,length(theta));
for i = 1:length(theta)
   %for each joint, determine the screw axis
   R=term(1:3,1:3);
    p_matrix=[    0     -term(3,4)  term(2,4);
              term(3,4)      0     -term(1,4);
             -term(2,4)  term(1,4)      0];
    Ad_term=[R zeros(3,3);
        p_matrix*R R];
   B(:,i)=Ad_M*S(:,i)
   B_matrix(:,:,i)=[  0  -B(i,3)  B(i,2) B(1,4);
                   B(i,3)   0    -B(i,1) B(2,4);
                  -B(i,2) B(i,1)    0    B(3,4);
                      0     0       0     0];
   if i==1
       T=expm(B_matrix(:,:,i)*theta(i));
   else
       T=T*expm(B_matrix(:,:,i)*theta(i));
   end
end
T=T*M;
end