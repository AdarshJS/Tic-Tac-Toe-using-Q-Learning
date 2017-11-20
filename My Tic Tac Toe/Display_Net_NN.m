%net1k stores values from 1 to 2000 obj:net1k
%net_4k stores values from 2001 to 4000 obj:net_4k
%net_6k stores values from 4001 to 6000 obj:net_6k
function Display_Net_NN()
example = matfile('net_10k.mat');
net10k = example.net_10k;
for i = 1:2000
    net10k(i)
end
end