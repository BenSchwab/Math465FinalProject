times = zeros(200,1);
i = 5;
[X,Y] = MNIST_helper([0,1],1000);
while i<1000
    tic;
    opts = struct('NumberNeighbors',i,'NumClusters',3,'LaplacianType', 'unnormalized'); 
    out = SpectralClusterer(X,Y, opts);

   times(i/5) = toc;
   i = i+5;
   i/5
end