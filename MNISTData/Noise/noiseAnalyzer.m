%%% Exploratory Data Analysis for MNIST dataset + NOISE

%% Generally, what does noisy image data look like?

queryDigits = [0,1,3,6];
numberOfPoints = 200;
noiseIter = 15;
%noiseVector = (0:noiseIter)*10;
imgOpts.imR = 28;
imgOpts.imC = 28;


numberOfClusters = 7;
averagePurities = zeros(1,noiseIter+1);
noiseVector = 0:20:300; %2.^(0:numTrials); %(0:20:2000);


for i=1:(noiseIter+1)
    [X,Y] = MNIST_helper(queryDigits, numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',30,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    purityMatrix
    averagePurity = sum(purityMatrix(:,1).*purityMatrix(:,3))/sum(purityMatrix(:,3));
    averagePurities(1,i) = averagePurity;
end
averagePurities
plot(noiseVector, averagePurities);
title(sprintf('[0,1,3,6] clustery purity as a function of noise - nData=%d',numberOfPoints))
