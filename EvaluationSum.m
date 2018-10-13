function [out_arg] = EvaluationSum(x)

% This function gets a vector of points and 
% calculates the fitness value (Sum of different power test function).
% Input:
%        x:       A vector containing the values of the variables
%
% Output:
%       out_arg: The fitness value of the input vector
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

n =size(x,2);
temp=0;
for i=1:n
    temp(1,i)=((abs(x(1,i)))^(i+1));
end
out_arg=sum(temp);
end
