function [out_arg] = EvaluationShubert(x)

% This function gets a vector of points and 
% calculates the fitness value (Shubert test function).
% Input:
%       x:       A vector containing the values of the variables
%
% Output:
%       out_arg: The fitness value of the input vector
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

x1 = x(1,1);
x2 = x(1,2);
sum1 = 0;
sum2 = 0;

for ii = 1:5
	new1 = ii * cos((ii+1)*x1+ii);
	new2 = ii * cos((ii+1)*x2+ii);
	sum1 = sum1 + new1;
	sum2 = sum2 + new2;
end

out_arg = sum1 * sum2;

end
