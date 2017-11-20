clc
Board = [1 1 2 1 0 2 0 0 0];
state = StateCalc(Board)
TrueActions = find(Board==0);
Q_Table = rand(3^9,9);
Q_Table(state,:)
%Q_Table = UpdateTrueActions(Q_Table, Board, state);
%Q_Table(state,:) = [0 0 0 0 0 0 0 0 0]
%nextmove = NextMoveCalculator(Board, state);
% Best_Value = -inf;
% for i = 1:size(TrueActions,2)%1 to number of actions that are possible for this state
%     if(Best_Value<Q_Table(state,TrueActions(i)))
%         Best_Value = Q_Table(state,TrueActions(i));
%         action = TrueActions(i) %TrueActions stores the indices of possible actions
%     end %I have not added the tiebreaker condition
% end
% %action = SelectAction(Q, Board, state, epsilon); %using epsilon greedy actions action stores the index where 1 or 2 has to be entered
% Board(action) = 1; %Take the action
% Board
% Next_state = StateCalc(Board) %Board and state are updated after the action is taken
%             
% [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state)
%  
% 
% % state
% % Q_Table(state,:)
% 
% % o60 = T60([1,2,3],:);
% % o60 = o60(:,4);
