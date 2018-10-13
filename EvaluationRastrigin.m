function [out_arg] = EvaluationRastrigin(x)

% This function gets a vector of points and 
% calculates the fitness value (Rastrigin test function).
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
for ii = 1:d
	xi = x(ii);
	summ = summ + (xi^2 - 10*cos(2*pi*xi));
end

out_arg = 10*d + summ;

end