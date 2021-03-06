%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculation of the space jacobian for Problem 4 of THA 2
% Input: N/A
% Output: space jacobian
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms L t1 t2 t3 t4 t5 t6;
S_1 = [0;0;1;0;0;0];
S_2 = [0;1;0;0;0;0];
S_3 = [-1;0;0;0;0;0];
S_4 = [-1;0;0;0;0;L];
S_5 = [-1;0;0;0;0;2*L];
S_6 = [0;1;0;0;0;0];

sskew1 = [0 -1 0 0;1 0 0 0;0 0 0 0;0 0 0 0];
sskew2 = [0 0 1 0;0 0 0 0;-1 0 0 0;0 0 0 0];
sskew3 = [0 0 0 0;0 0 1 0;0 -1 0 0;0 0 0 0];
sskew4 = [0 0 0 0;0 0 1 0;0 -1 0 L;0 0 0 0];
sskew5 = [0 0 0 0;0 0 1 0;0 -1 0 2*L;0 0 0 0];
sskew6 = [0 0 1 0;0 0 0 0;-1 0 0 0;0 0 0 0];

e_s1_t1 = screw_toT(sskew1(1:3,1:3),sskew1(1:3,4),t1);
e_s2_t2 = screw_toT(sskew2(1:3,1:3),sskew2(1:3,4),t2);
e_s3_t3 = screw_toT(sskew3(1:3,1:3),sskew3(1:3,4),t3);
e_s4_t4 = screw_toT(sskew4(1:3,1:3),sskew4(1:3,4),t4);
e_s5_t5 = screw_toT(sskew5(1:3,1:3),sskew5(1:3,4),t5);

J1 = S_1;
J2 = Ad(e_s1_t1)*S_2;
J3 = Ad(e_s1_t1*e_s2_t2)*S_3;
J4 = Ad(e_s1_t1*e_s2_t2*e_s3_t3)*S_4;
J5 = Ad(e_s1_t1*e_s2_t2*e_s3_t3*e_s4_t4)*S_5;
J6 = Ad(e_s1_t1*e_s2_t2*e_s3_t3*e_s4_t4*e_s5_t5)*S_6;

J = [J1,J2,J3,J4,J5,J6];
J(1,1)
J(1,2)
J(1,3)
J(1,4)
J(1,5)
J(1,6)
J(2,1)
J(2,2)
J(2,3)
J(2,4)
J(2,5)
J(2,6)
J(3,1)
J(3,2)
J(3,3)
J(3,4)
J(3,5)
J(3,6)
J(4,1)
J(4,2)
J(4,3)
J(4,4)
J(4,5)
J(4,6)
J(5,1)
J(5,2)
J(5,3)
J(5,4)
J(5,5)
J(5,6)
J(6,1)
J(6,2)
J(6,3)
J(6,4)
J(6,5)
J(6,6)
J = subs(J, [t1,t2,t3,t4,t5,t6,L], [0,0,0,0,0,0,1]);
J = simplify(J)