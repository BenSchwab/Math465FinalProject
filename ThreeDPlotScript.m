[X,Y] = MNIST_helper([0:9],600); 
opts = struct('NumberNeighbors',50,'NumClusters',10,'LaplacianType', 'ng-normalized');
c2 = SpectralClusterer(X,Y,opts);
pur = ClusterPurity(c2.Merged,Y,10);
DDDPlotter(c2.U,2:4,Y,'MNIST Data Spectral Clustering 3-dimension projection');


