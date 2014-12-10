times = zeros(1000);
dsize = 6;
while dsize<784
 [X,Y] = MNIST_helper([0,1],500); 
 X = rand(size(X,1), size(X,2));
  T = X(1:dsize,:);
 tic;
 opts = struct('NumberNeighbors',40,'NumClusters',2,'LaplacianType', 'unnormalized'); 
 out = SpectralClusterer(T,Y, opts);
 times(dsize/3) = toc;
 dsize = dsize +3;
 dsize/3
end





