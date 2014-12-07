nc = 2;
[X, Y] = blobInSphere(1000, 1000, 2);
scatter(X(1,:), X(2,:))
clusters = SpectralClusterer(X, struct('NumClusters', nc, 'NumberNeighbors', 70));
ClusterPurity(clusters, Y, nc)

count = 0;
for i = 1:2000
    if clusters(i) == 1
        count = count + 1;
    end
end
count