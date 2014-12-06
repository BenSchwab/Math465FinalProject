function [ purity ] = ClusterPurity(clusters, trueLabels, numClusters)
%CLUSTERPURITY Summary of this function goes here
%   Detailed explanation goes here

purityArr = zeros(numClusters,numClusters);
purity = zeros(numClusters,1);

for i = 1:size(clusters)
    cluster = clusters(i);
    %need to bump number labels up by one for Matlab indexing
    actual = trueLabels(i) +1;
    purityArr(cluster,actual) = purityArr(cluster,actual)+1;
end

for cluster = 1:numClusters
    purity(cluster) = max(purityArr(cluster, :))/sum(purityArr(cluster, :));
end

end

