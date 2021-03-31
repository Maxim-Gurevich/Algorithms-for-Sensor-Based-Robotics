function T = screw_toT(w,v,t)
%SCREW_TOT Summary of this function goes here
%   w = [3x3] skew form
%   v = [3x1] 

T= [exp(w*t),(eye(3)*t+(1-cos(t))*w+(t-sin(t))*w*w)*v;[0,0,0,1]];

end

