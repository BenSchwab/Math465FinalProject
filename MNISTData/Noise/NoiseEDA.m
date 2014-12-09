%%% Exploratory Data Analysis for MNIST dataset + NOISE

%% Generally, what does noisy image data look like?

queryDigits = 0:9;
numberOfPoints = 100;
noiseIter = 10;
noiseVector = (0:noiseIter)*10;
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
end

%% What does noisy image data look like for Digit X?

queryDigits = [9]; % set digit
numberOfPoints = 11;
noiseIter = 10;
noiseVector = (0:noiseIter)*10;
imgOpts.imR = 28;
imgOpts.imC = 28;
counter = 1;
for j = 1:(noiseIter+1)
    [X,Y] = MNIST_helper(queryDigits, numberOfPoints,noiseVector(j)); 
    plotPosition = subplot(1,numberOfPoints,counter);
    imagesc(reshape(X(:,j),[imgOpts.imR,imgOpts.imC]));
    colormap(gray);
    xlabel(strcat('NoiseParam: ',num2str(noiseVector(j))));
    pause(0.25);
    counter = counter + 1;
end

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

