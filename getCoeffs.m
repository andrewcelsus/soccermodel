function [ A ] = getCoeffs( input_args )
%GETCOEFFS Summary of this function goes here
%   Detailed explanation goes here

    temp_coeffs = csvread('coefficients.csv', 0,0);
    A = temp_coeffs;
end

