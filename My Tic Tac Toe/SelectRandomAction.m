function [Q_Table,action] = SelectRandomAction(Q_Table, Board, state)
TrueActions = find(Board==0);
Q_Table = UpdateTrueActions(Q_Table, Board, state);
Best_action = datasample(TrueActions,1);
action = Best_action;
end