function [out_arg] = EvaluationAckley(x)

% This function gets a vector of points and 
% calculates the fitness value (Ackley test function).
% Input:
%       x:       A vector containing the values of the variables
%
% Output:
%       out_arg: The fitness value of the input vector
%               
% � Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

d = length(x);
if (nargin < 4)
    c = 2*pi;
end
if (nargin < 3)
    b = 0.2;
end
if (nargin < 2)
    a = 20;
end
sum1 = 0;
sum2 = 0;
for ii = 1:d
	xi = x(ii);
	sum1 = sum1 + xi^2;
	sum2 = sum2 + cos(c*xi);
end
term1 = -a * exp(-b*sqrt(sum1/d));
term2 = -exp(sum2/d);
out_arg = term1 + term2 + a + exp(1);
end

