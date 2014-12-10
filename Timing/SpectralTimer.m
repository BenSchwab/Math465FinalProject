times = zeros(1000);
i = 40;
while i<5000
    [X,Y] = MNIST_helper([0,1],i); 
    tic;
    opts = struct('NumberNeighbors',40,'NumClusters',3,'LaplacianType', 'unnormalized'); 
    out = SpectralClusterer(X,Y, opts);

   times(i/5) = toc;
   i = i+5;
   i/5
end