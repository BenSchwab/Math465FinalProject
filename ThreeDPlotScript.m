[X,Y] = MNIST_helper(0:9,300); 
opts = struct('NumberNeighbors',50,'NumClusters',5,'LaplacianType', 'unnormalized');
c2 = SpectralClusterer(X,Y,opts);
pur = ClusterPurity(c2.Merged,Y,10);
DDDPlotter(c2.U,Y,'MNIST Data Spectral Clustering 3-dimension projection');


