%This function assigns a value of zero to all invalid actions
function [Q_Table] = UpdateTrueActions(Q_Table, Board, state1)
Occupied = find(Board~=0);
Q_row_current_state = Q_Table(state1,:);
for i = 1:size(Occupied,2) %1 to number of occupied boxes
    Q_row_current_state(Occupied(i))=0; %The zeros correspond to invalid actions and they must have value zero
end
%state1
%Q_row_current_state
%Q_Table(state1,:) = Q_row_current_state;
for i = 1:9
    Q_Table(state1,i) = Q_row_current_state(i);
end
% columns = [1 2 3 4 5 6 7 8 9];
% index = sub2ind(size(Q_Table),state1,columns);
% Q_Table(index) = Q_row_currect_state(columns);
end



