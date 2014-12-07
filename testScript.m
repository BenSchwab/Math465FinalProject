times = 5;
for i = 1:times
    nc = 7;
    tic
    [X,Y] = MNIST_helper([1,3,6,0], 600); 
    clusters = SpectralClusterer(X, struct('NumClusters', nc, 'NumberNeighbors', 40, 'auto',0));
    toc
    ClusterPurity(clusters, Y, nc)
end