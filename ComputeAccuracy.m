function [ correctPercent ] = ComputeAccuracy(actual, label)
%COMPUTEACCURACY Summary of this function goes here
%   Detailed explanation goes here

map = [7,1];
correct = 0;

for idx = 1:numel(actual)
    act = actual(idx);
    pred = label(idx);
    predMapped = map(pred);
    if(act == predMapped)
        correct =  correct +1;
    else
        'wrong';
    end
   
end

correctPercent = correct/numel(actual);



end

