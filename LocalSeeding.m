function Forest=LocalSeeding(Forest, Eval)

% This function gets the whole Forest and the evaluation function and
% performs local seeding on trees with Age 0
% Input:
%        Forest:     The whole Forest
%        Eval:       Evaluation function handler
%                    
% Output:
%        Forest: The Forest with newly added trees
%               
% © Copyright Ghaemi
% 8/3/2014 University of Tabriz, Tabriz, Iran

newtrees=[];
for q=1:size(Forest.T,1)
    if Forest.T(q,Forest.P.Dimension+2)==0 %Dimension+2 shows the Age of each tree
        current=Forest.T(q,:);
        % choosing LSC variables randomly
        move=[];
        for i=1:Forest.P.LSC
            move=[move, randi([1 Forest.P.Dimension])]; 
        end
        childs=[];
        for ww=move
            temp=current;
            add=random('unif',-Forest.P.dx ,Forest.P.dx ,1,1);
            temp(1,ww)=temp(1,ww)+add;
            if temp(1,ww)<Forest.P.Llimit
                temp(1,ww)=Forest.P.Llimit;
            elseif temp(1,ww)>Forest.P.Ulimit
                temp(1,ww)=Forest.P.Ulimit;
            end
            temp(1,Forest.P.Dimension+1)=Eval(temp(1,1:Forest.P.Dimension));
            temp(1,Forest.P.Dimension+2)=0;
            childs=[childs;temp];
        end
        
        newtrees=[newtrees;childs];
        childs=[];   
    end   
end
% Increasing the Age of all trees except for new trees
for u=1:size(Forest.T,1)
    Forest.T(u,Forest.P.Dimension+2)=Forest.T(u,Forest.P.Dimension+2)+1;
end
% adding the new trees with Age 0 to the Forest
Forest.T=[Forest.T; newtrees];
end