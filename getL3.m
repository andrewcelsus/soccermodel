function [ A ] = getL3( input_args )
%GETL3 Summary of this function goes here
%   Detailed explanation goes here

    B = csvread('coefficients.csv', 0,0);
    A = B(1,3);
end

