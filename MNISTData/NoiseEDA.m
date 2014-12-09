%%% Exploratory Data Analysis for MNIST dataset + NOISE

%% Discover range for noiseParam in GenerateDataSets (specifically for MNIST dataset)

numberOfClusters = 2;
queryDigits = [0,1];
numberOfPoints = 300;

numTrials = 10;
averagePurities = zeros(1,numTrials);
noiseVector = 2.^(0:numTrials); %(0:20:2000);

% explore the noiseParam space:
% 2.^(1:numTrials); 
% 2 -> 1024 yields .99 -> .50

for i=1:(numTrials+1)
    [X,Y] = MNIST_helper(queryDigits, numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',40,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = mean(purityMatrix(:,1));
    averagePurities(1,i) = averagePurity;
end

plot(noiseVector, averagePurities);

%% What does noisy image data look like?

numberOfClusters = 2;
queryDigits = [0,1];
numberOfPoints = 100;
noiseIter = 10;
noiseVector = (0:noiseIter)*10;

averagePurities = zeros(1,(noiseIter + 1));

imgOpts.imageData = true;
imgOpts.imR = 28;
imgOpts.imC = 28;

for j = 1:(noiseIter+1)
    [X,Y] = MNIST_helper(queryDigits, numberOfPoints,noiseVector(j)); 
    
    for k = 1:10
        imagesc(reshape(X(:,randperm(size(X,2),1)),[imgOpts.imR,imgOpts.imC]));
        colormap(gray);
        xlabel(strcat('NoiseParam: ',num2str(noiseVector(j))));
        pause(0.25);
    end
    
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',40,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = mean(purityMatrix(:,1));
    averagePurities(1,j) = averagePurity;
end

plot(noiseVector, averagePurities);
