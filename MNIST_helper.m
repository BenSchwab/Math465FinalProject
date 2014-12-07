% Wrapper to generate MNIST data
% IN: 
%      queryDigits: vector of digits to generate for
%      numPerPoint: Number of points per Digit
%      noiseLevel: size of the noise (dilation factor). Default: 0.
% OUT:
%       X: numPerPoint*numbeOfPoints by 28^2 vector of image data
%       Y: numPerPoint*numbeOfPoints by 1 vector of labels
function [X,Y] = MNIST_helper(queryDigits, numPerPoint, noiseLevel)
    MNISTOpts = struct('Sampling','RandN','QueryDigits',queryDigits,'ReturnForm','vector');
    if nargin < 3
        noiseLevel = 0;
    end
    Opts = struct('NumberOfPoints',numPerPoint,'MnistOpts',MNISTOpts,'NoiseType','Gaussian','NoiseLocation','entire','NoiseParam',noiseLevel);
    [X,~,~,Y] = GenerateDataSets('BMark_MNIST', Opts);
end
