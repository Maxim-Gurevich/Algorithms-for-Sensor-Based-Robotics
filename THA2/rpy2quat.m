function quaternion=rpy2quat(roll,pitch,yaw)
psi=yaw;
theta=pitch;
phi=roll;
A=[cos(psi/2);0;0;sin(psi/2)];
B=[cos(theta/2);0;sin(theta/2);0];
C=[cos(phi/2);sin(phi/2);0;0];
quaternion=A*B*C;
end