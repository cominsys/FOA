function [Forest,candidate]=PopulationLimiting(Forest)

% This function gets the whole Forest and forms the candidate population
% Input:
%        Forest:    The whole Forest
%
% Output:
%        Forest:    The Forest with old and extra trees removed
%        candidate: The candidate population to be used in the global seeding
%                   stage
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

temp=[];
candidate=[];
for i=1:size(Forest.T,1)
    if  Forest.T(i,Forest.P.Dimension+2)< Forest.P.Life_time
        temp=[temp; Forest.T(i,:)]; % trees with "Age" less than Life_time parameter
    else
        candidate=[candidate; Forest.T(i,:)]; % trees with "Age" bigger than Life_time parameter
    end
end
Forest.T=[];
Forest.T=temp;
[p,q]=sort(Forest.T(:,Forest.P.Dimension+1));% Dimension+1 shows the fitness
Forest.T=Forest.T(q,:);
if size(Forest.T,1)>Forest.P.area_limit % removing extra trees
    candidate=[candidate;Forest.T(Forest.P.area_limit+1:size(Forest.T,1),:)];
    Forest.T(Forest.P.area_limit+1:size(Forest.T,1), :)=[];
end
end %end of function