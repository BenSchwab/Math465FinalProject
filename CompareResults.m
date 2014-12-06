function [ output_args ] = CompareResults( actual, test )
%COMPARERESULTS Summary of this function goes here
%   Detailed explanation goes here
map = [7,1];
correct = 0;

for idx = 1:numel(actual)
    idx
    act = actual(idx);
    pred = test(idx);
    predM = map(pred);
    if(act == predM)
        correct =  correct +1;
    else
        'wrong';
    end
   
end

correct/numel(actual)


end

