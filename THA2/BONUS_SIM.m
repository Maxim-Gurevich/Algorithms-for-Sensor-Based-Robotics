SDA_10F = rigidBodyTree;
body1 = rigidBody('body1');

waist = rigidBodyJoint('waist','revolute');
waist.HomePosition = 0;
tform = trvec2tform([0, 0, 0]); % User defined
setFixedTransform(waist,tform);
body1.Joint = waist;
addBody(SDA_10F,body1,'base');

body2 = rigidBody('body2');
S = rigidBodyJoint('S','revolute');
S.HomePosition = 0; % User defined
tform2 = [0 0 1 0;0 1 0 0;-1 0 0 1.354;0 0 0 1]; % User defined
setFixedTransform(S,tform2);
body2.Joint = S;
addBody(SDA_10F,body2,'body1'); % Add body2 to body1

body3 = rigidBody('body3');
L = rigidBodyJoint('L','revolute');
L.HomePosition = 0; % User defined
tform3 = [1 0 0 0;0 0 -1 0;0 1 0 .25;0 0 0 1]; % User defined
setFixedTransform(L,tform3);
body3.Joint = L;
addBody(SDA_10F,body3,'body2'); % Add body3 to body2

body4 = rigidBody('body4');
E = rigidBodyJoint('E','revolute');
E.HomePosition = 0; % User defined
tform4 = [0 0 1 .18;0 1 0 0;-1 0 0 0;0 0 0 1]; % User defined
setFixedTransform(E,tform4);
body4.Joint = E;
addBody(SDA_10F,body4,'body3'); % Add body4 to body3

body5 = rigidBody('body5');
U = rigidBodyJoint('U','revolute');
U.HomePosition = 0; % User defined
tform5 = [0 0 1 0;0 1 0 0;-1 0 0 .18;0 0 0 1]; % User defined
setFixedTransform(U,tform5);
body5.Joint = U;
addBody(SDA_10F,body5,'body4'); % Add body5 to body4

body6 = rigidBody('body6');
R = rigidBodyJoint('R','revolute');
R.HomePosition = 0; % User defined
tform6 = [0 0 -1 -.18;0 1 0 0;1 0 0 0;0 0 0 1]; % User defined
setFixedTransform(R,tform6);
body6.Joint = R;
addBody(SDA_10F,body6,'body5'); % Add body6 to body5

body7 = rigidBody('body7');
B = rigidBodyJoint('B','revolute');
B.HomePosition = 0; % User defined
tform7 = [0 0 -1 0;0 1 0 0;1 0 0 .18;0 0 0 1]; % User defined
setFixedTransform(B,tform7);
body7.Joint = B;
addBody(SDA_10F,body7,'body6'); % Add body7 to body6

body8 = rigidBody('body8');
T = rigidBodyJoint('T','revolute');
T.HomePosition = 0; % User defined
tform8 = [0 0 1 .18;0 1 0 0;-1 0 0 0;0 0 0 1]; % User defined
setFixedTransform(T,tform8);
body8.Joint = T;
addBody(SDA_10F,body8,'body7'); % Add body8 to body7

show(SDA_10F)