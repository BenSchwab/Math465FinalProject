function [ purity ] = ClusterPurity(clusters, trueLabels, numClusters)
%CLUSTERPURITY Summary of this function goes here
%   Detailed explanation goes here

purity = zeros(numClusters,2);
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
   key_arr = cell2mat(keys(clusterMap));
   
   maxVal = 0;
   maxKey = -1;
   for i = 1:length(vals)
    key = key_arr(i);
    val = vals(i);
    if val >= maxVal
        maxVal = val;
        maxKey = key;
    end
   end
   purity(cluster, 1) = maxVal/sum(vals);
   purity(cluster, 2) = maxKey;
end


end

