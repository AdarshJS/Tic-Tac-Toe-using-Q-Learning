# Tic-Tac-Toe-using-Q-Learning
I have created an agent that will never lose in Tic Tac Toe. The agent was trained using Q-learning

Run the My_TTT program to train your agent. The number of iterations it took to get a perfect player was 100K for me. The agent learns by playing against a version of itself. The values are stored in a 3^9x9 matrix. The agent gets a reward of +1 for every win, 0 for a draw and -1 for every loss.

The programs Player_Random is used to test the training by making the agent play against a random player (one that makes random moves). The number of wins, draws, and success percentage are printed at the end. Player.m is used to play against the human player. The agent makes the first move by filling in a 1. The human player has to enter the location where 2 has to be entered. For example, 7 refers to the bottom left corner of the 3x3 board. 

By default both these programs import a Q Table that was created while I trained the agent. Please make the changes in both these programs if you want your Q table to be imported.

All these programs are easy to understand. The logic is pretty straight forward. 

For reference please see: https://github.com/khpeek/Q-learning-Tic-Tac-Toe
Also give Reinforcement Learning by Sutton and Barto a reading.
Thanks to Kurt Peek for an excellent ReadMe file.

The Program names Neural Network implements the same functionality but uses function approximation instead of the Q table. This program can be tested by Player_Random_NN and Player_NN programs. The entire function approximation for the Q table takes a long time. So i divided the training into sub nets to speed up the process. The program looks shabby. Better implementations are welcome.
