% This program is implemented by Manizheh Ghaemi (Author of article "Forest Optimization Algorithm")
% This program is distributed in the hope that it will be 
% useful, but WITHOUT ANY WARRANTY; EXPRESS OR IMPLIED.
% Questions/Comments: Please email Manizheh Ghaemi at:
% Manizheh.Ghaemi@yahoo.com.
% Proper Acknowledgements and authorship should be assured
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

function main(Func, dimension, Iterations, ShowResults, area_limit, Life_time, Transfer_rate) 
clc;
% Setting the default values for the parameters
if nargin < 6
    Func=1;             % Rastrigin=1; Ackley=2; Griewang=3; Shubert=4; Sum_of_powers=5;
    dimension=2;        % The dimension of the problem domain
    Iterations=2000;    % Maximum number of iterations
    ShowResults=1;      % when ShowResults=1, the trees are displayed; when ShowResults=0, the trees are not displayed;
    area_limit=20;      % The limitation of the forest
    Life_time=15;       % The maximum allowed Age of a tree 
    Transfer_rate=15;   % The percentage of candidate population for global seeding 
end
 
switch Func
    case 1 % Rastrigin with global optimum f(x)=0
        Eval = @EvaluationRastrigin;
        ranges = [-5.12, 5.12]; % The range of the variables
    case 2 % Akley with global optimum f(x)=0
        Eval = @EvaluationAckley;
        ranges = [-5,5]; % The range of the variables
    case 3 % Griewang with global optimum f(x)=0
        Eval = @EvaluationGriewangk; 
        ranges = [-600, 600]; % The range of the variables
    case 4 % Shubert with global optimum f(x)=-186.7309
        Eval = @EvaluationShubert;
        ranges = [-5.12, 5.12]; % The range of the variables
        dimension=2; %The given form of function has only two variables
    case 5 % Sum_of_powers with global optimum f(x)=0
        Eval = @EvaluationSum;
        ranges = [-1 ,1]; % The range of the variables
end
Forest=InitializeForest(Eval,ranges,dimension,Iterations, area_limit, Life_time, Transfer_rate);
Forest=FOA(Forest,Eval,ShowResults);       
