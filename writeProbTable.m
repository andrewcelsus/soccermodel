function [  ] = writeProbTable( home, away )
%WRITEPROBTABLE Summary of this function goes here
%   Detailed explanation goes here

    [pi_ratings, u] = getPi();
    lambda3 = getL3();
    coeffs = getCoeffs();

    ratings = zeros(20,4);

    num_teams = 20;

    for i = 1:num_teams
        ratings(i,1) = coeffs(i,1);
        ratings(i,2) = coeffs(i,2);
        ratings(i,3) = pi_ratings(i,1);
        ratings(i,4) = pi_ratings(i,2);
    end

    lambda1 = u + ratings(home,1) + ratings(away,2) + ratings(home,3);
    lambda2 = u + ratings(away,1) + ratings(home,2) + ratings(away,4); 

    M = zeros(1,3);
    M(1,1) = max(lambda1,0);
    M(1,2) = max(lambda2,0);
    M(1,3) = lambda3;

    csvwrite('lambdas.csv', M);

end

