function [S, theta]=TMatrix2ScrewAngle(T)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract R, p from T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R= T(1:3,1:3);
p= T(1:3,4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matrix Logarithm of Rotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if R==eye(3)
    theta=0;
    omega=1/(2*sin(theta))*(R-transpose(R));
elseif trace(R)==-1
    theta=pi;
    omega=(1/sqrt(2*(1+R(3,3))))*[R(1,3);R(2,3);1+R(3,3)];
else
    theta=acos(.5*(trace(R)-1));
    
    % make sure theta is between 0 and pi
    while theta>=pi
        theta=theta-pi;
    end
    while theta<0
        theta=theta+pi;
    end
    
    omega=(1/(2*sin(theta)))*(R-transpose(R));
end
omega=[0 -omega(3) omega(2);
    omega(3) 0 -omega(1);
    -omega(2) omega(1) 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate v
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v=(1/theta*eye-.5*omega+...
    (1/theta-.5*cot(theta/2))*(omega^2))*p;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construct S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S=[omega v;
    0 0 0 0];






end