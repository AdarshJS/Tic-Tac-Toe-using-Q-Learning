%encodes the board config into a stateIndex 
function [state] = StateCalc(Board)
    state = Board*[3^0;3^1;3^2;3^3;3^4;3^5;3^6;3^7;3^8] + 1; %Gives 3^9 values
end
