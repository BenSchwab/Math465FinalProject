[X,Y] = MNIST_helper(0:9,300); 
opts = struct('NumberNeighbors',50,'NumClusters',10,'LaplacianType', 'unnormalized');
c2 = SpectralClusterer(X,Y,opts);
pur = ClusterPurity(c2.Merged,Y,10);
[u,s,v] = SVD(U);
u(:,1:3)*s(1:3,1:3)*v(:,1:3);
DDDPlotter(c2.U,Y,'MNIST Data Spectral Clustering 3-dimension projection');
