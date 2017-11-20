%This function selects the action that has maximum value in Q table for
%next state
function [Q_Table,Q_Worst_Next] = QWorstValue(Q_Table,Board,Next_state,TerminalState)
%MaxRewardAct = 0;
if TerminalState == 1 %if next state is Terminal state, Q(s',a)=0
    Q_Worst_Next = 0;
else
    TrueActions_Next = find(Board==0); %finds indices of empty boxes in board. 
    Q_Table = UpdateTrueActions_Next(Q_Table, Board, Next_state);
    Best_Value_Next = inf;
    for i = 1:size(TrueActions_Next,2)%1 to number of actions that are possible for this state
        if(Best_Value_Next>Q_Table(Next_state,TrueActions_Next(i)))
            Best_Value_Next = Q_Table(Next_state,TrueActions_Next(i));
            %Best_action_next = TrueActions_Next(i); %TrueActions stores the indices of possible actions
        end %I have not added the tiebreaker condition
    end
    Q_Worst_Next = Best_Value_Next;
end
end