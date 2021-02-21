function R=AxisAngle2RotMat(ax,ay,az,angle)

%find magnitude of vector
mag=sqrt(ax^2+ay^2+az^2);

%divide each term by the magnitude (normalize)
x=ax/mag;
y=ay/mag;
z=az/mag;

%define additional terms
c=cos(angle);
s=sin(angle);
t=1-c;

%solve for rotation matrix
R=zeros(3);
R(1,1)=t*x*x+c;
R(1,2)=t*x*y-z*s;
R(1,3)=t*x*z+y*s;

R(2,1)=t*x*y+z*s;
R(2,2)=t*y*y+c;
R(2,3)=t*y*z-x*s;

R(3,1)=t*x*z-y*s;
R(3,2)=t*y*z+x*s;
R(3,3)=t*z*z+c;
end