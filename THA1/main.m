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
S1=[0 0 1];
S2=[1 0 0];
H1=2;
H2=-2;
theta1=pi;
theta2=pi/2;
Tinit1=[1 0 0 2;0 1 0 0;0 0 1 0;0 0 0 1];
Tinit2=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];

Question_3(Q1,S1,H1,theta1,Tinit1)
Question_3(Q1,S1,H1,theta1,Tinit2)
Question_3(Q1,S1,H2,theta1,Tinit1)
Question_3(Q1,S2,H1,theta1,Tinit1)
Question_3(Q2,S1,H1,theta1,Tinit1)
Question_3(Q1,S1,H1,theta2,Tinit1)

%%
%3a. configuration_calculator.m
Screw1 = [0 0 3 0;0 0 0 1;-3 0 0 0;0 0 0 0];
Screw2 = [0 0 0 0;0 0 0 1;0 0 0 0;0 0 0 0];
Theta1 = 0;
Theta2 = 1;
Tinit = [0,-2,0,1;2,0,0,0;0,0,0,0;0,0,0,1];

[a3,b3,c3,d3] = configuration_calculator(Screw1,Theta1,Tinit)
[e3,f3,g3,h3] = configuration_calculator(Screw1,Theta2,Tinit)
[i3,j3,k3,l3] = configuration_calculator(Screw2,Theta2,Tinit)
[m3,n3,o3,p3] = configuration_calculator(Screw2,Theta1,Tinit)
%%
%3b. screw2qsh.m
S11 = [0 -1 .333 0;1 0 -.333 0;-.333 .333 0 , 1;0 0 0 0];
S22 = [0 -.333 .333 0;.333 0 -.333 0;-.333 .333 0 , 1;0 0 0 0];

[a4,b4,c4] = screw2qsh(S11)
[d4,e4,f4] = screw2qsh(S22)