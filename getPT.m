function [ PT ] = getPT( )
%GETPT Summary of this function goes here
%   Detailed explanation goes here

    pre_PT = csvread('prob_table.csv', 1,1, [1,1, 9,9]);

    sum = 0;
    
    for i = 1:9
        for j = 1:9
            sum = sum + pre_PT(i,j);
        end
    end
    
    for i = 1:9
        for j = 1:9
            PT(i,j) = pre_PT(i,j)/sum;
        end
    end
    
end

