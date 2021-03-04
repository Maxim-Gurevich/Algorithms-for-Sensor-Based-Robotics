%Test cases%
%%
%1. angle_axis_func
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
%2. quaternion_func.m
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
%3. euler_angle_func.m
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
