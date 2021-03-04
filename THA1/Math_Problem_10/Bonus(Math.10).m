function [R,Difference]Bonus(Math_10)=(A)
format short

angles=[0 0 0];

Norms=[0 0;
       0 0;
       0 0];

for k=1:3

    end
    upper=2*pi;
    lower=0;
    range=upper-lower;
    i=0;
    while range > .0001 && i <100
        if (upper~=2*pi || lower~=0) && (upper-lower)>pi
            lower=lower+2*pi;
        elseif (lower-upper)>pi
            upper=upper+2*pi;
        end
        for q=1:3
            if upper==2*pi && lower==0
                angles(k)=(upper*q/3);
            else   
                angles(k)=(lower+(q-1)/2*(upper-lower));
            end
            R=Matrix_R(angles);
            Norms(q,1)=Matrix_Difference_Norm(A,R);
            Matrix_Difference_Norm(A,R);
            Norms(q,2)=angles(k);
        end
        Norms=sortrows(Norms)
        if max(Norms(1,2),Norms(2,2))-...
                min(Norms(1,2),Norms(2,2))<range/2
            lower=min(Norms(1,2),Norms(2,2));
            upper=max(Norms(1,2),Norms(2,2));
        else
            lower=max(Norms(1,2),Norms(2,2));
            upper=min(Norms(1,2),Norms(2,2));
        end
        range=abs(upper-lower)
        while lower>2*pi
            lower=lower-2*pi;
        end
        while upper>2*pi
            upper=upper-2*pi;
        end
        angles(k)=lower;
        R=Matrix_R(angles);
        i=i+1
    end
end
end