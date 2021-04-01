clear all
clc
syms L
theta=[0 0 pi/2 L];
n=length(theta);
B=[0 1 0 0;
   0 0 0 0;
   1 0 1 0;
  -L 0 0 0;
   0 0 0 1;
   0 L 0 0];
for i=1:n
B_matrix(:,:,i)=[  0  -B(3,i)  B(2,i) B(4,i);
                   B(3,i)   0    -B(1,i) B(5,i);
                  -B(2,i) B(1,i)    0    B(6,i);
                      0     0       0     0];
end

term(:,:,1)=expm(-B_matrix(:,:,4)*theta(4))*...
    expm(-B_matrix(:,:,3)*theta(3))*...
    expm(-B_matrix(:,:,2)*theta(2));
term(:,:,2)=expm(-B_matrix(:,:,4)*theta(4))*...
    expm(-B_matrix(:,:,3)*theta(3));
term(:,:,3)=expm(-B_matrix(:,:,4)*theta(4));

for i=1:3
    R=term(1:3,1:3,i);
    p_matrix=[    0     -term(3,4,i)  term(2,4,i);
              term(3,4,i)      0     -term(1,4,i);
             -term(2,4,i)  term(1,4,i)      0];
    Ad_term=[    R      zeros(3,3);
             p_matrix*R      R];
    J(:,i)=Ad_term*B(:,i);
end

J(:,4)=[0;0;0;0;1;0];
V_b=J*[1;1;1;1];
J
p_dot=transpose(V_b(4:6))






