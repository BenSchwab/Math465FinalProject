[X,Y] = MNIST_helper([1,7,0],600); 
opts = struct('NumberNeighbors',50,'NumClusters',3,'LaplacianType', 'unnormalized');
c2 = SpectralClusterer(X,Y,opts);
pur = ClusterPurity(c2.Merged,Y,4);
DDDPlotter(c2.U,1:3,Y,'MNIST Data Spectral Clustering 3-dimension projection');


