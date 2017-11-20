%My Tic Tac Toe game training phase
clear
clc
Q_Table = rand(3^9,9); %Q table init with random numbers
epsilon = 0.9;
plr1 = 1;
plr2 = 2;
alpha = 0.3; %Learning Rate
y = 0.2; %discount factor
Episode_counter = 0;

for episodes = 1:100000
    Episode_counter = Episode_counter + 1;
    Board = [0 0 0 0 0 0 0 0 0]; %initial board
    state = StateCalc(Board); %Initial state
    TerminalState = 0; %Not terminal state
    Winner = 0;
    k = 1;
    while(TerminalState == 0 ) %No wins or draws
        NextMove = NextMoveCalculator(Board, state); 
        
        if (NextMove==1) %Player 1's turn
            [Q_Table,action] = SelectAction(Q_Table, Board, state, epsilon); %using epsilon greedy actions action stores the index where 1 or 2 has to be entered
            Board(action) = plr1; %Player 1 makes a move

            Next_state = StateCalc(Board);  %Board is updated after the action is taken State is not updated here
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            [Q_Table, Q_Worst_Next] = QWorstValue(Q_Table,Board,Next_state,TerminalState);
            
            %Q_Table(state,:)
            Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Worst_Next) - Q_Table(state,action));
            %Q_Table(state,:)
            state = Next_state;
            if TerminalState==1 && Winner == 1
                fprintf('\nPlayer 1 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 2
                fprintf('\nPlayer 2 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('\nDraw in episode %d\n',Episode_counter);
            end
            
        elseif (NextMove==2)
            [Q_Table, action] = SelectAction_Min(Q_Table, Board, state, epsilon); %using epsilon greedy actions action stores the index where 1 or 2 has to be entered
            Board(action) = plr2; %Take the action, Board is updated after the action is take
            Next_state = StateCalc(Board);%State is not updated here
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            
            [Q_Table, Q_Best_Next] = QBestValue(Q_Table,Board,Next_state,TerminalState);
            
            %Q_Table(state,:)
            Q_Table(state,action) = Q_Table(state,action) + alpha*(Reward + y*(Q_Best_Next) - Q_Table(state,action));
            %Q_Table(state,:)
            state = Next_state;
            if TerminalState==1 && Winner == 1
                fprintf('Player 1 wins in episode %d',Episode_counter);
            elseif TerminalState==1 && Winner == 2
                fprintf('Player 2 wins in episode %d',Episode_counter);
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('Draw in episode %d',Episode_counter);
            end
        end
    end   
end
save('Q_Trained_5.mat','Q_Table');
            
                
                
                
        
    
    
    

