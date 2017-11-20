function [Q_Table,action] = SelectAction_Min(Q_Table, Board, state, epsilon)

%action stores the column location of the Q table that has the highest
%value or some random action based on epsilon; That will correspond to the location in Board where a 1 or 2 has to be entered 

TrueActions = find(Board==0); %finds indices of empty boxes in board. Basically gives possibilities of actions
Q_Table = UpdateTrueActions(Q_Table, Board, state); %make impossible action values as zeros (already filled boxes)
prob =  0.1*randi(10);
if prob>epsilon % Then select lowest value actions
    Best_Value = inf;
    for i = 1:size(TrueActions,2)%1 to number of actions that are possible for this state
        if(Best_Value>Q_Table(state,TrueActions(i)))
            Best_Value = Q_Table(state,TrueActions(i));
            Best_action = TrueActions(i); 
            tieCounter = 1;
            tieActions = Best_action*ones(1,1);
        elseif(Best_Value==Q_Table(state,TrueActions(i)))
            tieCounter = tieCounter + 1;
            tieActions(tieCounter) = TrueActions(i);%Tieactions stores indices of all same value actions 
        end 
    end
    if(tieCounter > 1)
        Best_action = randsample(tieActions, 1, true, (1/tieCounter)*ones(1,tieCounter));%the last argument is the weight given for weighted average it is 1/number of actions with same values.
    end
else %select random action
    Best_action = datasample(TrueActions,1);
end
action = Best_action;
end
        
