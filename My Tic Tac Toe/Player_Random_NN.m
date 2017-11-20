%function where random player plays with the agent

function Player_Random_NN()
%a = net(1)
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
num_wins = 0;
num_Ties = 0;
for i = 1:100 %Play for 10000 times
    Board = [0 0 0 0 0 0 0 0 0];
    state = StateCalc(Board);
    TerminalState = 0;
    while(TerminalState == 0 ) 
        NextMove = NextMoveCalculator(Board, state);
        if (NextMove==1) 
            %Select Action based on state
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
            
            state = Next_state;
            
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
            %[Q_Table,action] = SelectRandomAction(Q_Table, Board, state);
            TrueActions = find(Board==0);
            Best_action = datasample(TrueActions,1);
            action = Best_action;
            
            Board(action) = plr2; %Take the action, Board is updated after the action is take
            Next_state = StateCalc(Board);%State is not updated here
           
            Display_Board = Convert_Board(Board);
            %Display_Board
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            
            state = Next_state
            
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
success_Rate = 100*(num_Ties + num_wins)/100
%save('Q_Trained_3.mat','Q_Table');
end