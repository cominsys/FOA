function [Forest, bestTree]=UpdateBestTree(Forest, bestTree)

% This function gets the whole Forest and the best so far tree and updates the best tree
% Input:
%       Forest:     The whole Forest
%       bestTree:   The best so far tree of the Forest
%
% Output:
%       Forest: The updated Forest
%       bestTree: The updated best tree
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

Index_of_best=1;
for u=1:size(Forest.T,1)
    if Forest.T(u,Forest.P.Dimension+1)<=bestTree(1,Forest.P.Dimension+1)% Dimension+1 is the fitness value
        bestTree=Forest.T(u,:);
        Index_of_best=u;
    end
end
 if  Forest.T(Index_of_best,Forest.P.Dimension+1)<bestTree(1,Forest.P.Dimension+1) % update the best tree
     bestTree=Forest.T(Index_of_best,:);
     bestTree(1,Forest.P.Dimension+2)=0; % Dimension+2 shows the Age of each tree
     Forest.T(Index_of_best,:)=[];
     Forest.T=[bestTree;Forest.T];
 else % update the age of the best tree
     updated_best=Forest.T(Index_of_best,:);
     updated_best(1,Forest.P.Dimension+2)=0;
     Forest.T(Index_of_best,:)=[];
     Forest.T=[updated_best;Forest.T];
     bestTree=updated_best;
 end

end