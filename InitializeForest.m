function Forest=InitializeForest(Eval, Ranges, dim, Iterations, area_limit, Life_time, Transfer_rate)
% This function gets the evaluation function, the ranges of the variables,
% the dimension, the maximum number of iterations, area_limit parameter,
% Life_time parameter and Transfer_rate as input and forms the initial
% Forest. If the input parameters are not provided, the default values in
% the Main function will be used
% Input:
%       Eval:           Evaluation function handler
%       Ranges:         A 1*2 matrix containing the lower and the upper limits of the
%                       variables
%       dim:            Dimension of the problem domain
%       Iterations:     The predefined maximum number of iterations used for stop
%                       condition
%       area_limit:     The limitation of the forest
%       Life_time:      The maximum allowed Age of a tree 
%       Transfer_rate:  The percentage of candidate population for global seeding 
%
% Output:
%       Forest:         The initialized Forest of trees
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran
 

% Forest.P: Parameters
% Forest.T: Trees
 Forest.P.area_limit=area_limit;         % The limitation of the forest
 Forest.P.Life_time=Life_time;           % The maximum allowed age of a tree 
 Forest.P.Transfer_rate=Transfer_rate;   % The percentage of candidate population 
 Forest.P.Dimension=dim;                 % The dimension of the problem domain
 Forest.P.Llimit=Ranges(1,1);            % The lower limit of the variables
 Forest.P.Ulimit=Ranges(1,2);            % The upper limit of the variables
 Forest.P.MaxIterations=Iterations;      % Maximum number of iterations
 Forest.P.dx=(abs(Forest.P.Ulimit)/5);   % dx is a small value used in local seeding. This value is not used in binary problems and in discrete problem, this value should be rounded.
 if dim<5
     Forest.P.LSC=1; % Local seeding changes (1/5 of the dimension)
     Forest.P.GSC=1; % Global seeding changes
 else
     Forest.P.LSC=floor((2*Forest.P.Dimension)/10); % 20 percent (not optimal) of the dimension used in local seeding
     Forest.P.GSC=floor((1*Forest.P.Dimension)/10); % 10 percent (not optimal) of the dimension used in global seeding   
 end
 % Forming the Forest with randomly generated trees
 Forest.T(:,:)=random('unif',Forest.P.Llimit,Forest.P.Ulimit,Forest.P.area_limit,Forest.P.Dimension); 
 for q=1:size(Forest.T,1)
     Forest.T(q,Forest.P.Dimension+1)=Eval(Forest.T(q,1:Forest.P.Dimension));
     Forest.T(q,Forest.P.Dimension+2)=0;
 end
 
end
