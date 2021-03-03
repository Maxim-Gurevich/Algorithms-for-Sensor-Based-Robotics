function [config_1,config_2,config_3,config_4] = configuration_calculator(screw,theta,Tinit)
%UNTITLED Summary of this function goes here
%   Screw format is [[w],v;0,0] : theta is in radians

theta1 = theta/4;
theta2 = theta/2;
theta3 = (3/4)*theta;
theta4 = theta;

w = screw(1:3,1:3);
w3 = [w(3,2);w(1,3);w(2,1)];
w_l = sqrt(w3(1)^2+w3(2)^2+w3(3)^2);

v = screw(1:3,4);
if w_l ~= 0
    T1 = [eye(3)+(w/w_l)*sin(w_l*theta1)+(w^2/(w_l)^2)*(1-cos(w_l*theta1)),(eye(3)*theta1+(1-cos(theta1))*w+(theta1-sin(theta1))*w*w)*v;[0,0,0,1]];
    T2 = [eye(3)+(w/w_l)*sin(w_l*theta2)+(w^2/(w_l)^2)*(1-cos(w_l*theta2)),(eye(3)*theta2+(1-cos(theta2))*w+(theta2-sin(theta2))*w*w)*v;[0,0,0,1]];
    T3 = [eye(3)+(w/w_l)*sin(w_l*theta3)+(w^2/(w_l)^2)*(1-cos(w_l*theta3)),(eye(3)*theta3+(1-cos(theta3))*w+(theta3-sin(theta3))*w*w)*v;[0,0,0,1]];
    T4 = [eye(3)+(w/w_l)*sin(w_l*theta4)+(w^2/(w_l)^2)*(1-cos(w_l*theta4)),(eye(3)*theta4+(1-cos(theta4))*w+(theta4-sin(theta4))*w*w)*v;[0,0,0,1]];
else
    T1 = [eye(3),v*theta1;[0,0,0,1]];
    T2 = [eye(3),v*theta2;[0,0,0,1]];
    T3 = [eye(3),v*theta3;[0,0,0,1]];
    T4 = [eye(3),v*theta4;[0,0,0,1]];
end
config_1 = T1*Tinit;
config_2 = T2*Tinit;
config_3 = T3*Tinit;
config_4 = T4*Tinit;
end

