% Wrapper to generate MNIST data
% IN: 
%      queryDigits: vector of digits to generate for
%      numPerPoint: Number of points per Digit
% OUT:
%       X: numPerPoint*numbeOfPoints by 28^2 vector of image data
%       Y: numPerPoint*numbeOfPoints by 1 vector of labels
function [X,Y] = MNIST_helper(queryDigits, numPerPoint)
    [X_temp,Y]=Generate_MNIST(numPerPoint, struct('Sampling', 'RandN', 'QueryDigits', queryDigits, 'ReturnForm', 'vector'));
    X = X_temp';
end