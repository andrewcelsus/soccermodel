function [ CDF ] = getCDF( input_args )
%GETCDF Summary of this function goes here
%   Detailed explanation goes here

    PT = getPT();
    
    for i = 2:9
        for j = 1:9
            PT(i, j) = PT(i-1,j) + PT(i,j);
        end
    end
    
    for i = 2:9
        x = PT(9,i-1);
        for j = 1:9
            PT(j,i) = PT(j,i)+x;
        end
    end
    
    CDF = PT;
    
end

