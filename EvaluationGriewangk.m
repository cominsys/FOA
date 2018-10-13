function [out_arg] = EvaluationGriewangk(x)

% This function gets a vector of points and 
% calculates the fitness value (Griewangk test function).
% Input:
%       x:       A vector containing the values of the variables
%
% Output:
%       out_arg: The fitness value of the input vector
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

d = length(x);
summ = 0;
prod = 1;
for ii = 1:d
	xi = x(ii);
	summ = summ + xi^2/4000;
	prod = prod * cos(xi/sqrt(ii));
end
out_arg = summ - prod + 1;
end