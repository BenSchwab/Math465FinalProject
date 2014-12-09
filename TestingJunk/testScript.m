times = 1;
for i = 1:times
    nc = 7;
    
    [X,Y] = MNIST_helper([1,3,6,0], 600,0); 
    [clusters, G] = SpectralClusterer(X, Y, struct('NumClusters', nc, 'NumberNeighbors', 40, 'auto',0));
    ClusterPurity(clusters.Unmerged, Y, nc)
end