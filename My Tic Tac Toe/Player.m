%Player Function I play with the agent

function Player()
Board = [0 0 0 0 0 0 0 0 0];
state = StateCalc(Board);
epsilon = 0;
plr1 = 1;
plr2 = 2;
%alpha = 0.5;
%y = 0.5;
example = matfile('Q_Trained_5.mat');
Q_Table = example.Q_Table;
%Q_Table
TerminalState = 0; %Not terminal state
Winner = 0;
while(TerminalState == 0 ) %No wins or draws
    NextMove = NextMoveCalculator(Board, state);
    if (NextMove==1) %Agent's turn
        [Q_Table,action] = SelectAction(Q_Table, Board, state, epsilon); %using epsilon greedy actions action stores the index where 1 or 2 has to be entered
        Board(action) = plr1; %Player 1 makes a move
        Next_state = StateCalc(Board);%Board is updated after the action is taken State is not updated here
        [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
        %Update Q Table
        %[Q_Table, Q_Best_Next] = QBestValue(Q_Table,Board,Next_state,TerminalState);
        %Q_Table(state,:)
        %Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Best_Next) - Q_Table(state,action));
        %Q_Table(state,:)
        state = Next_state;
        Board();
        Display_Board = Convert_Board(Board);
        Display_Board
        if TerminalState==1 && Winner == 1
            fprintf('\nPlayer 1 wins \n');
        elseif TerminalState==1 && Winner == 2
            fprintf('\nPlayer 2 wins \n');
        elseif TerminalState==1 && Winner == 3 %Draw
            fprintf('\nDraw in episode\n');
        end
        
    elseif (NextMove==2) %My move
        %action = SelectAction(Q_Table, Board, state, epsilon); %using epsilon greedy actions action stores the index where 1 or 2 has to be entered
        prompt = ' Enter The location where you wish to add a 2:';
        action = input(prompt);
        Board(action) = plr2; %Take the action, Board is updated after the action is take
        Next_state = StateCalc(Board);%State is not updated here
        %Board
        Display_Board = Convert_Board(Board);
        Display_Board
        [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
        %Update Q Table
        [Q_Table, Q_Best_Next] = QBestValue(Q_Table,Board,Next_state,TerminalState);
        %Q_Table(state,:)
        %Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Best_Next) - Q_Table(state,action));
        %Q_Table(state,:)
        state = Next_state;
        if TerminalState==1 && Winner == 1
            fprintf('Player 1 wins');
        elseif TerminalState==1 && Winner == 2
            fprintf('You win');
        elseif TerminalState==1 && Winner == 3 %Draw
            fprintf('Draw');
        end
    end
end
%save('Q_Trained_3.mat','Q_Table');
end