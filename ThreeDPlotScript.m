[X,Y] = MNIST_helper([0,1,7,5,3],600); 
opts = struct('NumberNeighbors',50,'NumClusters',3,'LaplacianType', 'unnormalized');
c2 = SpectralClusterer(X,Y,opts);
pur = ClusterPurity(c2.Merged,Y,3);
DDDPlotter(c2.U,Y,'MNIST Data Spectral Clustering 3-dimension projection');


