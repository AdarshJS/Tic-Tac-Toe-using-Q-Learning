%Function approximation using the Q table
clear
clc

example = matfile('Q_Trained_5.mat');
Q_Table = example.Q_Table;

%Inputs must be the state, and output must be the max value actions
for i = 1:2000
    input(i) = i;
    [Val Target(i)] = max(Q_Table((10000+i),:));
    %Target(i)
end

eg = 0.02;
sc = 1;
net_12k = newrb(input, Target,eg,sc);

for i = 1:100
    net_12k(i)
end

for i = 1:2000
    input(i) = i;
    [Val Target(i)] = max(Q_Table((12000+i),:));
    %Target(i)
end

eg = 0.02;
sc = 1;
net_14k = newrb(input, Target,eg,sc);

for i = 1:100
    net_14k(i)
end

for i = 1:2000
    input(i) = i;
    [Val Target(i)] = max(Q_Table((14000+i),:));
    %Target(i)
end

eg = 0.02;
sc = 1;
net_16k = newrb(input, Target,eg,sc);

for i = 1:100
    net_16k(i)
end

for i = 1:2000
    input(i) = i;
    [Val Target(i)] = max(Q_Table((16000+i),:));
    %Target(i)
end

eg = 0.02;
sc = 1;
net_18k = newrb(input, Target,eg,sc);

for i = 1:100
    net_18k(i)
end

for i = 1:1683
    input(i) = i;
    [Val Target(i)] = max(Q_Table((18000+i),:));
    %Target(i)
end

eg = 0.02;
sc = 1;
net_20k = newrb(input, Target,eg,sc);

for i = 1:100
    net_20k(i)
end
