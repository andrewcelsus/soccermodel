function [ A, u] = getPi( input_args )
%GETPI Summary of this function goes here
%   Detailed explanation goes here

    filename = 'soccer_model.xlsx';
    range = 'A2:D91';
    sheet = 'Sheet2';
    
    A = xlsread(filename, sheet, range);

    b = 10;
    c = 3;
    lambda = 0.035;
    gamma = 0.7;

    numteams = 20;
    
    ratings = zeros (numteams, 2);

    d = size(A);
    n = d(1);

    temp_home = 0;
    temp_away = 0;
    
    for i = 1:n
        temp_home = temp_home + A(i,1);
        temp_away = temp_away + A(i,2);
    end
    
    u = (temp_home + temp_away)/(2*n);
        
    for i = 1:n
        home = A(i,3);
        away = A(i,4);
        
        rh = ratings(home,1);
        ra = ratings(away,2);
        
        if (rh<0)
            gdh = -(b^(abs(rh)/c)-1);
        else
            gdh = b^(abs(rh)/c)-1;
        end
        
        if (ra<0)
            gda = -(b^(abs(ra)/c)-1);
        else
            gda = b^(abs(ra)/c)-1;
        end
        
        e_gd = gdh - gda;
        gd = A(i,1) - A(i,2);
        
        e = abs(gd-e_gd);
        
        psi = c*log10(1+e);
        
        if (e_gd<gd)
            psi_h = psi;
        else
            psi_h = -1*psi;
        end
        
        if (e_gd>gd)
            psi_a = psi;
        else 
            psi_a = -1*psi;
        end
        
        ratings(home,1) = rh + psi_h*lambda;
        ratings(home,2) = ratings(home,2) + (ratings(home,1)-rh)*gamma;
        ratings(away,2) = ra + psi_a*lambda;
        ratings(away,1) = ratings(away,1) + (ratings(away,2)-ra)*gamma;
    end
    
    A = ratings;
end

