# Tic-Tac-Toe-using-Q-Learning
I have created an agent that will never lose in Tic Tac Toe. The agent was trained using Q-learning.

Clone the My Tic Tac Toe folder into a convenient location in your computer. Open the My_TTT program in MATLAB and run the code. The My_TTT program trains your agent using Q-learning. The number of iterations it took to get a perfect player was 100K in my case. The agent learns by playing against a version of itself and the values are stored in a 3^9x9 matrix (Q-Table). The agent gets a reward of +1 for every win, 0 for a draw and -1 for every loss. The Q-Table is saved at the very end of the program. Please change the provided name while training on your own.

The user may try different values for alpha (learning rate), epsilon (for the epsilon greedy algorithm), and y (discount factor), and observe the differences to get a better understanding of Q-Learning.

The Player_Random program is used to test the training by making the agent play against a random player (one that makes random moves). The number of wins, draws, and success percentage are printed at the end. Player.m is used to play against the human player. The agent makes the first move by filling in a 1. The human player has to enter the location where 2 has to be entered. For example, 7 refers to the bottom left corner of the 3x3 board. 

By default both these programs import a Q Table that was created while I trained the agent. Please make the changes in both these programs if you want your Q table to be imported.

All these programs are easy to understand. The logic is pretty straight forward. 

For reference please see [here](https://github.com/khpeek/Q-learning-Tic-Tac-Toe)
Also give Reinforcement Learning by Sutton and Barto a reading.
Thanks to Kurt Peek for an excellent ReadMe file.

The Program named Neural Network implements the same functionality but uses function approximation instead of the Q table. This program can be tested by Player_Random_NN and Player_NN programs. The entire function approximation for the Q table takes a long time. So i divided the training into sub nets to speed up the process. These are stored as .mat files named net_1K to net_20K. The program is a very rudimentary implementation . Better implementations are welcome.
