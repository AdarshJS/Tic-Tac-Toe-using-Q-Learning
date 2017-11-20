%Calculates who makes next move
function [NextMove] = NextMoveCalculator(Board, state)
num1 = size(find(Board==1),2); %number of 1s
num2 = size(find(Board==2),2); %Number of 2s

if (state==1) %empty board
    NextMove = 1; %Player 1 starts
elseif state~=1 && (num1>num2)
    NextMove = 2;
elseif state~=1 && (num2==num1)
    NextMove = 1;
%else
%    NextMove = 0; %Terminal State
end
end

    
    