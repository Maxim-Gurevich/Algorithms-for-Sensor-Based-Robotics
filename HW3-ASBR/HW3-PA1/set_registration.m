function T = set_registration(A,B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: % Generates Optimal Transformation Matrix T to go from set A to B
% Input: 2 sets: rows are points [N,3]
% Output: T [4,4]
% Date: 4/22/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Step 1: Compute abar, bbar
N = height(A);
a_bar = sum(A,1)/N;
b_bar = sum(B,1)/N;
%Step 2: Compute a~, b~
a = A;
b = B;

for i=1:N
    a(i,:) = a(i,:) - a_bar;
    b(i,:) = b(i,:) - b_bar;
end
%Step 3: Find R using eigenvalue decomposition
H = zeros(3,3);
for i=1:N
   H = H + [a(i,1)*b(i,1) a(i,1)*b(i,2) a(i,1)*b(i,3);
            a(i,2)*b(i,1) a(i,2)*b(i,2) a(i,2)*b(i,3);
            a(i,3)*b(i,1) a(i,3)*b(i,2) a(i,3)*b(i,3)]; 
end
delta_t = [H(2,3)-H(3,2) H(3,1)-H(1,3) H(1,2)-H(2,1)]; 
G = [trace(H) delta_t;
     delta_t.' H+H.'-trace(H)*eye(3)];
[V,D] = eig(G);
[d,ind] = sort(diag(D));
Ds = D(ind,ind);
Vs = V(:,ind);

q = Vs(:,4);
R = [q(1)^2+q(2)^2-q(3)^2-q(4)^2,2*(q(2)*q(3)-q(1)*q(4)),2*(q(2)*q(4)+q(1)*q(3));
     2*(q(2)*q(3)+q(1)*q(4)),q(1)^2-q(2)^2+q(3)^2-q(4)^2,2*(q(3)*q(4)-q(1)*q(2));
     2*(q(2)*q(4)-q(1)*q(3)),2*(q(3)*q(4)+q(1)*q(2)),q(1)^2-q(2)^2-q(3)^2+q(4)^2];
%Step 4: Find P 
P = b_bar.'-R*a_bar.';

T = [R [P(1);P(2);P(3)];
     0 0 0 1];
end

