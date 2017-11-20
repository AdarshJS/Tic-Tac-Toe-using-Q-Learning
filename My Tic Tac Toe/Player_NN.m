%Player Function I play with the agent

function Player()
Board = [0 0 0 0 0 0 0 0 0];
state = StateCalc(Board);
epsilon = 0;
plr1 = 1;
plr2 = 2;
example = matfile('net1k.mat');
net_2k = example.net1k;
example = matfile('net_4k.mat');
net_4k = example.net_4k;
example = matfile('net_6k.mat');
net_6k = example.net_6k;
example = matfile('net_8k.mat');
net_8k = example.net_8k;
example = matfile('net_10k.mat');
net_10k = example.net_10k;
example = matfile('net_12k.mat');
net_12k = example.net_12k;
example = matfile('net_14k.mat');
net_14k = example.net_14k;
example = matfile('net_16k.mat');
net_16k = example.net_16k;
example = matfile('net_18k.mat');
net_18k = example.net_18k;
example = matfile('net_20k.mat');
net_20k = example.net_20k;
TerminalState = 0; %Not terminal state
Winner = 0;
while(TerminalState == 0 ) %No wins or draws
    NextMove = NextMoveCalculator(Board, state);
    if (NextMove==1) %Agent's turn
        if state>=1 && state<=2000
                action = net_2k(state);
            elseif state>=2001 && state<=4000
                action = net_4k(state-2000);
            elseif state>=4001 && state<=6000
                action = net_6k(state-4000);
            elseif state>=6001 && state<=8000
                action = net_8k(state-6000);
            elseif state>=8001 && state<=10000
                action = net_10k(state-8000);
            elseif state>=10001 && state<=12000
                action = net_12k(state-10000);
            elseif state>=12001 && state<=14000
                action = net_14k(state-12000);
            elseif state>=14001 && state<=16000
                action = net_16k(state-14000);
            elseif state>=16001 && state<=18000
                action = net_18k(state-16000);
            elseif state>=18001 && state<=19683
                action = net_20k(state-18000);
            end
        action = round(action,0);
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