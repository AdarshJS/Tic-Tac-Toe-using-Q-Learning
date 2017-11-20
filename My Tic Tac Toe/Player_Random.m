%function where random player plays with the agent

function Player_Random()

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
num_wins = 0;
num_Ties = 0;
for i = 1:10000 %Play for 10000 times
    Board = [0 0 0 0 0 0 0 0 0];
    state = StateCalc(Board);
    TerminalState = 0;
    while(TerminalState == 0 ) 
        NextMove = NextMoveCalculator(Board, state);
        if (NextMove==1) 
            [Q_Table,action] = SelectAction(Q_Table, Board, state, epsilon); 
            Board(action) = plr1; %Player 1 makes a move
            Next_state = StateCalc(Board);%Board is updated after the action is taken State is not updated here
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            %Update Q Table
            %[Q_Table, Q_Best_Next] = QBestValue(Q_Table,Board,Next_state,TerminalState);
            %Q_Table(state,:)
            %Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Best_Next) - Q_Table(state,action));
            %Q_Table(state,:)
            state = Next_state;
            %Board();
            Display_Board = Convert_Board(Board);
            %Display_Board
            if TerminalState==1 && Winner == 1
                fprintf('\nPlayer 1 wins \n');
                num_wins = num_wins + 1;
            elseif TerminalState==1 && Winner == 2
                fprintf('\nPlayer 2 wins \n');
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('\nDraw in episode\n');
                num_Ties = num_Ties + 1;
            end
            
        elseif (NextMove==2) 
            [Q_Table,action] = SelectRandomAction(Q_Table, Board, state);
            Board(action) = plr2; %Take the action, Board is updated after the action is take
            Next_state = StateCalc(Board);%State is not updated here
           
            Display_Board = Convert_Board(Board);
            %Display_Board
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            %Update Q Table
            %[Q_Table, Q_Best_Next] = QBestValue(Q_Table,Board,Next_state,TerminalState);
            %Q_Table(state,:)
            %Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Best_Next) - Q_Table(state,action));
            %Q_Table(state,:)
            state = Next_state;
            if TerminalState==1 && Winner == 1
                fprintf('Player 1 wins');
                num_wins = num_wins + 1;
            elseif TerminalState==1 && Winner == 2
                fprintf('You win');
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('Draw');
                num_Ties = num_Ties+1;
            end
        end
    end
end
num_wins
num_Ties
success_Rate = 100*(num_Ties + num_wins)/10000
%save('Q_Trained_3.mat','Q_Table');
end