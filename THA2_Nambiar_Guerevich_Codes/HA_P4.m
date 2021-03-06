L = 1;
syms t1 t2 t3 t4 t5 t6 d1 d2 d3 d4 d5 d6 a1 a2 a3 a4 a5 a6 alpha1 alpha2 alpha3 alpha4 alpha5 alpha6
%H01 = DH(t1+90,L,0,90);
%H02 = DH(t2+90,0,0,90);
%H03 = DH(t3+90,0,L,0);
%H04 = DH(t4,0,L,0);
%H05 = DH(t5-90,0,0,-90);
%H06 = DH(t6+90,L,0,90);

H01 = [cos(t1) -sin(t1) 0 0;sin(t1) cos(t1) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d1;0 0 0 1]*[1 0 0 a1;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha1) -sin(alpha1) 0;0 sin(alpha1) cos(alpha1) 0;0 0 0 1];
H02 = [cos(t2) -sin(t2) 0 0;sin(t2) cos(t2) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d2;0 0 0 1]*[1 0 0 a2;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha2) -sin(alpha2) 0;0 sin(alpha2) cos(alpha2) 0;0 0 0 1];
H03 = [cos(t3) -sin(t3) 0 0;sin(t3) cos(t3) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d3;0 0 0 1]*[1 0 0 a3;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha3) -sin(alpha3) 0;0 sin(alpha3) cos(alpha3) 0;0 0 0 1];
H04 = [cos(t4) -sin(t4) 0 0;sin(t4) cos(t4) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d4;0 0 0 1]*[1 0 0 a4;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha4) -sin(alpha4) 0;0 sin(alpha4) cos(alpha4) 0;0 0 0 1];
H05 = [cos(t5) -sin(t5) 0 0;sin(t5) cos(t5) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d5;0 0 0 1]*[1 0 0 a5;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha5) -sin(alpha5) 0;0 sin(alpha5) cos(alpha5) 0;0 0 0 1];
H06 = [cos(t6) -sin(t6) 0 0;sin(t6) cos(t6) 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 1 0 0;0 0 1 d6;0 0 0 1]*[1 0 0 a6;0 1 0 0;0 0 1 0;0 0 0 1]*[1 0 0 0;0 cos(alpha6) -sin(alpha6) 0;0 sin(alpha6) cos(alpha6) 0;0 0 0 1];

p_0 = [0;0;0;1];
p_e = H01*H02*H03*H04*H05*H06;
p_e = subs(p_e,[d1 d2 d3 d4 d5 d6],[L,0,0,0,0,L]);
p_e = subs(p_e,[a1 a2 a3 a4 a5 a6],[0,0,L,L,0,0]);
p_e = subs(p_e,[alpha1 alpha2 alpha3 alpha4 alpha5 alpha6],[90,90,0,0,-90,90])
%v1 = cross(R_00*[0;0;1],(p_05 - p_00));
%v2 = cross(R_01*[0;0;1],(p_05 - p_01));
%v3 = cross(R_02*[0;0;1],(p_05 - p_02));
%v4 = cross(R_03*[0;0;1],(p_05 - p_03));
%v5 = cross(R_04*[0;0;1],(p_05 - p_04));
%v6 = cross(R_05*[0;0;1],(p_05 - p_05));

%w1 = R_00*[0;0;1];
%w2 = R_01*[0;0;1];
%w3 = R_02*[0;0;1];
%w4 = R_03*[0;0;1];
%w5 = R_04*[0;0;1];
%w6 = R_05*[0;0;1];

%Jb = [w1,w2,w3,w4,w5,w6;v1,v2,v3,v4,v5,v6]

