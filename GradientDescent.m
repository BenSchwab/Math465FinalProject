function [out] = GradientDescent(X, start, step)
    numClusters = start;
    G = SpectralClusterer(X, struct('NumClusters', numClusters, 'NumberNeighbors', 10));
    purity = ClusterPurity(G.labels, Y, nc)
end