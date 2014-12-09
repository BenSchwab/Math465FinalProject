numberOfClusters = 2;
queryDigits = [0,1];
numberOfPoints = 300;

numTrials = 100;
averagePurities = zeros(1,numTrials);
noiseVector = (0:20:2000);

% explore the noiseParam space:
% 2.^(1:numTrials); 
% 2 -> 1024 yields .99 -> .50

for i=1:(numTrials+1)
    [X,Y] = MNIST_helper(queryDigits, numberOfPoints,noiseVector(i)); 
    [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',40,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = mean(purityMatrix(:,1));
    averagePurities(1,i) = averagePurity;
end

plot(noiseVector, averagePurities);