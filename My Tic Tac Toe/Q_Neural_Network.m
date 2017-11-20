%Neural network and Q learning
%No need Q(s,a)
%The NN will have 9 inputs corresponding to each box in the board.
%It will have 1 output which will be the index at which the next x or o has
%o be put.

clc
net = feedforwardnet(10); %Initialising NN
%net = init(net);

epsilon = 0.9;
plr1 = 1;
plr2 = 2;
alpha = 0.3; %Learning Rate
y = 0.2; %discount factor
Episode_counter = 0;

for episodes = 1:100000
    Episode_counter = Episode_counter + 1;
    Board = [0 0 0 0 0 0 0 0 0];
    net = configure(net,'inputs',Board);
    state = StateCalc(Board);
    Qs = zeros(1,9);
    Qs_prime = zeros(1,9);
    TerminalState = 0; %Not terminal state
    Winner = 0;
    while(TerminalState == 0 )
        NextMove = NextMoveCalculator(Board, state);
        if (NextMove==1)
            Qs = net(Board); %Get the Q values
            if (rand()>epsilon)
                [Qs_max_value, action] = max(Qs);%select max value function
            else
                action = randi([1 9],1,1); %select random action and return that board index
            end
            for i = 1:9
                S(i) = Board(i); %store s state and also equivalent to s = s'
            end
            Board(action) = plr1; %Board now has become s'
            Next_state = StateCalc(Board);
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            Qs_prime = net(Board); %next state,action values
            
            if TerminalState == 0
                Q_Target = Reward + y*min(Qs_prime);
            else
                Q_Target = Reward;
            end
            
            Targets = Qs; %Review this step
            Targets(action) = Q_Target;
            net = train(net,S,Targets);
            
            if TerminalState==1 && Winner == 1
                fprintf('\nPlayer 1 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 2
                fprintf('\nPlayer 2 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('\nDraw in episode %d\n',Episode_counter);
            end
            
        elseif (NextMove==2)
            Qs = net(Board); %Get the Q values
            
            if (rand()>epsilon)
                [Qs_max_value, action] = min(Qs);%select min value function for player 2
            else
                action = randi([1 9],1,1); %select random action and return that board index
            end
            
            for i = 1:9
                S(i) = Board(i); %store s state and also equivalent to s = s'
            end
            
            Board(action) = plr1; %Board now has become s'
            Next_state = StateCalc(Board);
            [Reward,Winner,TerminalState] = RewardCalc(Board, Next_state);
            Qs_prime = net(Board); %next state,action values
            
            if TerminalState == 0
                Q_Target = Reward + y*max(Qs_prime); %Updating the same way as the Q table problem
            else
                Q_Target = Reward;
            end
            
            Targets = Qs; %Review this step
            Targets(action) = Q_Target;
            net = train(net,S,Targets);
            
            if TerminalState==1 && Winner == 1
                fprintf('\nPlayer 1 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 2
                fprintf('\nPlayer 2 wins in episode %d\n',Episode_counter);
            elseif TerminalState==1 && Winner == 3 %Draw
                fprintf('\nDraw in episode %d\n',Episode_counter);
            end
        end
    end
end

        
            
            
            
            
            
            
            
                
                
            
            
    
    

