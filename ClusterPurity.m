function [ purity ] = ClusterPurity(clusters, trueLabels, numClusters)
%CLUSTERPURITY Summary of this function goes here
%   Detailed explanation goes here
purity = zeros(numClusters,1);

clusterKeys = unique(trueLabels);
for cluster = 1:numClusters
    clusterMap = containers.Map(clusterKeys, zeros(length(clusterKeys),1));
   for  i = 1:length(clusters)
        value = clusters(i);
        if value == cluster
            actual = trueLabels(i);
            if ~isKey(clusterMap, actual)
                clusterMap(actual) = 0;
            end
            clusterMap(actual) = clusterMap(actual) + 1;
        end
   end
   vals = cell2mat(values(clusterMap));
   
   purity(cluster) = max(vals)/sum(vals);
end


end

