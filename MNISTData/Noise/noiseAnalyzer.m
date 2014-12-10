%%% Exploratory Data Analysis for MNIST dataset + NOISE

%% Generally, what does noisy image data look like?

queryDigits = [0,1,3,6];
numberOfPoints = 100;
noiseIter = 15;
%noiseVector = (0:noiseIter)*10;
imgOpts.imR = 28;
imgOpts.imC = 28;


numberOfClusters = 7;
averagePurities = zeros(1,noiseIter+1);
noiseVector = 0:20:300; %2.^(0:numTrials); %(0:20:2000);


zero_one_averagePurities = zeros(1,noiseIter+1);
one_seven_averagePurities = zeros(1,noiseIter+1);
zero_six_averagePurities = zeros(1,noiseIter+1);
all_digits_averagePurities = zeros(1,noiseIter+1);
for i=1:(noiseIter+1)
    %%
    % 0 1
    %%
    [X,Y] = MNIST_helper([0,1], numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',30,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = sum(purityMatrix(:,1).*purityMatrix(:,3))/sum(purityMatrix(:,3));
    zero_one_averagePurities(1,i) = averagePurity;
    
    
    %%
    % 1 7
    %%
    [X,Y] = MNIST_helper([1,7], numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',30,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = sum(purityMatrix(:,1).*purityMatrix(:,3))/sum(purityMatrix(:,3));
    one_seven_averagePurities(1,i) = averagePurity; 
    
    %%
    % [0,1,3,6]
    %%
    [X,Y] = MNIST_helper([0,1,3,6], numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',30,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = sum(purityMatrix(:,1).*purityMatrix(:,3))/sum(purityMatrix(:,3));
    zero_six_averagePurities(1,i) = averagePurity; 
    
    %%
    % [0-9]
    %%
    [X,Y] = MNIST_helper(0:9, numberOfPoints,noiseVector(i)); 
    [clusters, ~] = SpectralClusterer(X, Y, struct('NumClusters',numberOfClusters,'NumberNeighbors',30,'auto',0));
    purityMatrix = ClusterPurity(clusters.Unmerged, Y, numberOfClusters);
    averagePurity = sum(purityMatrix(:,1).*purityMatrix(:,3))/sum(purityMatrix(:,3));
    all_digits_averagePurities(1,i) = averagePurity; 
end

plot(noiseVector, zero_one_averagePurities, 'r');
hold on;
plot(noiseVector, one_seven_averagePurities, 'b');
hold on;
plot(noiseVector, zero_six_averagePurities, 'g');
 hold on;
plot(noiseVector, all_digits_averagePurities, 'black');
legend('[0,1]','[1,7]', '[0,1,3,6]','[0-9]', 'Location','southwest')
title(sprintf('clustery purity as a function of noise - nData=%d',numberOfPoints))
ylim([0,1])
