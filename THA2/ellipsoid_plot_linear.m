function [eig_vals,eig_vects] = ellipsoid_plot_linear(jacobian)
%ELLIPSOID_PLOT_LINEAR Summary of this function goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Determining ellipsoid of manipubility (linear velocity)
% Input: Jacobian (6xn)
% Output: Visualization of ellipsoid, axes lengths[1x3], and axes[1x3] directions
% Date: 3/30/21 
% Author: Zahin Nambiar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dims = size(jacobian);
columns = dims(2);
Jv = jacobian(4:6,1:columns);
A = Jv*transpose(Jv);
[eigenvalues,eigenvector] = eig(A); 
eig_vals = diag(eigenvalues);%eigenvalues in a 1D vector

[X,Y,Z] = ellipsoid(0,0,0,eig_vals(1),eig_vals(2),eig_vals(3));
surf(X,Y,Z);
title('Linear Ellipsoid Plot');
grid on
xlabel('v1')
ylabel('v2')
zlabel('v3')
axis equal
eig_vects = eigenvector; %eigenvectors are the columns

end
