function [ X,Y ] = getScore( input_args )
%GETSCORE() Summary of this function goes here
%   Detailed explanation goes here

    CDF = getCDF();
    
    N = 9999;
    X = 0;
    Y = 0;
    
    vector_CDF = reshape(CDF, [], 1);
    
    for i = 1:N
        r = rand();

        if r > vector_CDF(1,1)
            for i = 2:81
                if r <= vector_CDF(i,1)
                    if r > vector_CDF(i-1,1)
                        check = i;
                    end
                end
            end
        end

        if r <= vector_CDF(1,1)
            check = 1;
        end

        X_temp = mod(check,9) - 1;
        Y_temp = floor(check/9);

        X = X+X_temp;
        Y = Y+Y_temp;
    end
    
    X = X/N;
    Y = Y/N;
end

