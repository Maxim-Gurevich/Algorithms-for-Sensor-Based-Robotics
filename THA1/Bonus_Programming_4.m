function [within,R]=Bonus_Programming_4(A,threshold)
    [M,diff]=Bonus_Math_10(A);
    if diff>threshold
        within=false;
    else
        within=true;  
    end
    R=M;
end