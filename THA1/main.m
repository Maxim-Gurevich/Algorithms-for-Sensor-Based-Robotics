%Test cases%
%%
%1a. angle_axis_func
I1 = [0 1 2 3;4 5 6 7;8 9 10 11;12 13 14 15];
I2 = [0 -1 0;1 0 0;0 0 1];
I3 = [0 0 1;1 0 0;0 1 0];
I4 = [3 3 3;3 3 3;3 3 3];
I5 = [3 2 2;3 4 5];

[a,b,c] = angle_axis_func(I1)
[d,e,f] = angle_axis_func(I2)
[g,h,i] = angle_axis_func(I3)
[j,k,l] = angle_axis_func(I4)
[m,n,o] = angle_axis_func(I5)

%%
%1b. quaternion_func.m
I1 = [0 1 2 3;4 5 6 7;8 9 10 11;12 13 14 15];
I2 = [0 -1 0;1 0 0;0 0 1];
I3 = [0 0 1;1 0 0;0 1 0];
I4 = [3 3 3;3 3 3;3 3 3];
I5 = [3 2 2;3 4 5];

[a1,b1] = quaternion_func(I1)
[d1,e1] = quaternion_func(I2)
[g1,h1] = quaternion_func(I3)
[j1,k1] = quaternion_func(I4)
[m1,n1] = quaternion_func(I5)

%%
%1c. euler_angle_func.m
I1 = [0 1 2 3;4 5 6 7;8 9 10 11;12 13 14 15];
I2 = [0 -1 0;1 0 0;0 0 1];
I3 = [0 0 1;1 0 0;0 1 0];
I4 = [3 3 3;3 3 3;3 3 3];
I5 = [3 2 2;3 4 5];
I6 = eye(3);
[a2,b2,c2] = euler_angle_func(I1)
[d2,e2,f2] = euler_angle_func(I2)
[g2,h2,i2] = euler_angle_func(I3)
[j2,k2,l2] = euler_angle_func(I4)
[m2,n2,o2] = euler_angle_func(I5)
[p2,q2,r2] = euler_angle_func(I6)

%%
%2a. AxisAngle2RotMat.m
R1 = [1 0 0];
R2 = [0 1 0];
R3 = [0 0 1];
P1 = pi;
P2 = pi/2;
P3 = -pi;
[a3] = AxisAngle2RotMat(R1,P1)
[b3] = AxisAngle2RotMat(R2,P2)
[c3] = AxisAngle2RotMat(R3,P3)

%%
%2b. Quat2RotMat.m
Q1 = [.7071 0 0 .7071];
Q2 = [.5 .5 .5 .5];

[a4] = Quat2RotMat(Q1)
[b4] = Quat2RotMat(Q2)

%%
% Question3.m
close all
Q1=[0 2 0];
Q2=[2 0 0];
Q3=[0 0 2];
S1=[0 0 1];
H1=2;
H2=-2;
theta1=pi;
theta2=pi/2;
Tinit1=[1 0 0 2;0 1 0 0;0 0 1 0;0 0 0 1];
Tinit2=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

Question_3(Q1,S1,H1,theta1,Tinit1)
Question_3(Q1,S1,H1,theta1,Tinit2)
Question_3(Q1,S1,H2,theta1,Tinit1)
Question_3(Q2,S1,H1,theta1,Tinit1)
Question_3(Q1,S1,H1,theta2,Tinit1)

%%
%3a. qsh2screw.m
Q1a=[0 2 0];
Q2a=[0 0 0];
S1a=[0 0 1];
S2a=[1 0 0];
H1a=2;
H2a=0;

a5 = qsh2screw(Q1a,S1a,H1a)
b5 = qsh2screw(Q1a,S1a,H2a)
c5 = qsh2screw(Q2a,S1a,H1a)
d5 = qsh2screw(Q1a,S2a,H1a)

%%
%3b. configuration_calculator.m
Screw1 = [0 0 3 0;0 0 0 1;-3 0 0 0;0 0 0 0];
Screw2 = [0 0 0 0;0 0 0 1;0 0 0 0;0 0 0 0];
Theta1 = 0;
Theta2 = 1;
Tinit = [0,-2,0,1;2,0,0,0;0,0,0,0;0,0,0,1];

[a6,b6,c6,d6] = configuration_calculator(Screw1,Theta1,Tinit)
[e6,f6,g6,h6] = configuration_calculator(Screw1,Theta2,Tinit)
[i6,j6,k6,l6] = configuration_calculator(Screw2,Theta2,Tinit)
[m6,n6,o6,p6] = configuration_calculator(Screw2,Theta1,Tinit)

%%
%3c. TMatrix2ScrewAngle.m
T1=[1 0 0 1;0 1 0 1;0 0 1 1; 0 0 0 0];
T2=[1 0 0 0;0 cos(2) -sin(2) 0;0 sin(2) cos(2) 0;0 0 0 0];
T3=[1 0 0 1;0 cos(2) -sin(2) 1;0 sin(2) cos(2) 1;0 0 0 0];

a7 = TMatrix2ScrewAngle(T1)
b7 = TMatrix2ScrewAngle(T2)
c7 = TMatrix2ScrewAngle(T3)
%%
%3d. screw2qsh.m
S1b = [0 -1 .333 0;1 0 -.333 0;-.333 .333 0 , 1;0 0 0 0];
S2b = [0 -.333 .333 0;.333 0 -.333 0;-.333 .333 0 , 1;0 0 0 0];

[a4,b4,c4] = screw2qsh(S1b)
[d4,e4,f4] = screw2qsh(S2b)
%%
%3d. RotTrans2ScrewAngle.m
clc
R1a=[1 0 0;0 cos(2) -sin(2);0 sin(2) cos(2)];
R2a=[cos(2) 0 sin(2);0 1 0;-sin(2) 0 cos(2)];
P1a=0;
P2a=1;

a7 = RotTrans2ScrewAngle(R1a,P1a)
b7 = RotTrans2ScrewAngle(R1a,P2a)
c7 = RotTrans2ScrewAngle(R2a,P2a)