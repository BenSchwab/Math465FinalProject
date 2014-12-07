function [ Clusters, G] = SpectralClusterer(X,Y,Opts)
%X is the DxN input data. Y is a N element array of the true labels.
%Opts is an array of optional options as follows:
%
%
Clusters = {};

G = LaplacianBuilder(X,Opts);

%Preform the spectral projection
[EigenVec,EigenVal] = eig(G.L); 
U = EigenVec(:,1:Opts.NumClusters);

%Compute the clusters on the projection with K-means
clusters = kmeans(U, Opts.NumClusters);



%TODO: make this step optional

%Combine the clusters if predominant label is the same
merged = zeros(Opts.NumClusters);
newClusters = zeros(length(clusters),1);
clusterPurities = ClusterPurity(clusters,Y, Opts.NumClusters);
nextClusterNum = 1;


for clusterNum = 1:Opts.NumClusters
    if merged(clusterNum)
        continue 
    end
    clusterLabel = clusterPurities(clusterNum,2);
    %Set that this cluster has been merged
    merged(clusterNum) = 1;
    relabel(clusterNum, nextClusterNum);
    for cluserTwoNum = clusterNum+1:Opts.NumClusters
        secondClusterLabel = clusterPurities(cluserTwoNum,2);
        if secondClusterLabel == clusterLabel
            relabel(cluserTwoNum, clusterNum);
            merged(cluserTwoNum) = 1;
        end
    end
    nextClusterNum = nextClusterNum +1;   
end


function relabel(oldCluster,newCluster)
    for c = 1:length(clusters)
        if(clusters(c) == oldCluster)
            newClusters(c) = newCluster;
        end
    end     
end


%Group the data into clusters
clusterSet = cell(0);



Clusters.Merged = newClusters;
Clusters.Unmerged = clusters;
%Clusters.ClusterSets = clusterSet



end

