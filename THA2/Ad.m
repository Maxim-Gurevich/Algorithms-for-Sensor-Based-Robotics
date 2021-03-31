function A = Ad(T)
%AD Summary of this function goes here
%   In put 4 x 4 Transformation matrix output Adjoint matrix 6x6
p = [T(1,4),T(2,4),T(3,4)];
A = [T(1:3,1:3),[0 0 0;0 0 0;0 0 0];[0 -p(3) p(2);p(3) 0 -p(1);-p(2) p(1) 0]*T(1:3,1:3),T(1:3,1:3)];
end

