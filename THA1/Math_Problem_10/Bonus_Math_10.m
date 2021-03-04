function [R,Matrix_Difference]=Bonus_Math_10(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: Calculates closest rotation matrix to given matrix
% Input: any 3x3 matrix
% Output: Rotation Matrix (3x3), value showing matrix similarity
% Date: 3/3/21 
% Author: Maxim Gurevich
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format short

%stucture to keep track of resulting euler angles
angles=[0 0 0];
%structure to keep track of difference values
Norms=[0 0;
       0 0;
       0 0];
   
%loop once for each euler angle
for k=1:3
    upper=2*pi;
    lower=0;
    range=upper-lower;
    i=0;
    %range indicates precision of final result
    %i is used to force quit if algorithm takes too long
    while range > .0001 && i <100
        %make sure current search range is valid
        if (upper~=2*pi || lower~=0) && (upper-lower)>pi
            lower=lower+2*pi;
        elseif (lower-upper)>pi
            upper=upper+2*pi;
        end
        %subdivide search range in half, 
        %with points of inquiry at upper, mid, and lower
        for q=1:3
            if upper==2*pi && lower==0
                angles(k)=(upper*q/3);
            else   
                angles(k)=(lower+(q-1)/2*(upper-lower));
            end
            %for each point, evaluate norm
            R=Matrix_R(angles);
            Norms(q,1)=Matrix_Difference_Norm(A,R);
            Norms(q,2)=angles(k);
        end
        %sort results of three inquiries
        Norms=sortrows(Norms);
        %select the two lowest results and set their location as next
        %search range
        if max(Norms(1,2),Norms(2,2))-...
                min(Norms(1,2),Norms(2,2))<range/2
            lower=min(Norms(1,2),Norms(2,2));
            upper=max(Norms(1,2),Norms(2,2));
        else
            lower=max(Norms(1,2),Norms(2,2));
            upper=min(Norms(1,2),Norms(2,2));
        end
        %identiry size of range for the while loop
        range=abs(upper-lower);
        %correction for when the angle crosses over zero
        while lower>2*pi
            lower=lower-2*pi;
        end
        while upper>2*pi
            upper=upper-2*pi;
        end
        angles(k)=lower;
        %iterate i
        i=i+1;
    end
end
    %output
    R=Matrix_R(angles);
    Matrix_Difference=Matrix_Difference_Norm(A,R);
end
