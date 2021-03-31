%Zahin Nambiar DH THA2 3/24
function f = DH(theta, d1, a1, alpha1)
syms t z1 z2 z3 z4 f
t = theta; %degrees
d = d1; % 
a = a1;
alpha = alpha1;

z1 = [cosd(t) -sind(t) 0 0;
      sind(t) cosd(t) 0 0;
      0 0 1 0;
      0 0 0 1];
z2 = [1 0 0 0;
      0 1 0 0;
      0 0 1 d;
      0 0 0 1];
z3 = [1 0 0 a;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];
z4 = [1 0 0 0;
      0 cosd(alpha) -sind(alpha) 0;
      0 sind(alpha) cosd(alpha) 0;
      0 0 0 1];
f = z1*z2*z3*z4;
end

