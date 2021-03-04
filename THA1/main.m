%Test cases%
%%
%1. angle_axis_func
I1 = [0 1 2 3;4 5 6 7;8 9 10 11;12 13 14 15];
I2 = [0 -1 0;1 0 0;0 0 1];
I3 = [0 0 1;1 0 0;0 1 0];
I4 = [3 3 3;3 3 3;3 3 3];
I5 = [3 2 2;3 4 5];

[a,b,c] = angle_axis_func(I1)
[d,e,f] = angle_axis_func(I2)
[g,h,i] = angle_axis_func(I3)
[j,k,l] = angle_axis_func(I4)
[m,n,o] = angle_axis_func(I5)

%%




%%