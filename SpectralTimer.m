NumpointsTimes = {};
x = zeros(200,1);
times = zeros(200,1);
i = 40;
while i<1500
    [X,Y] = MNIST_helper([0,1],i); 
    tic;
    opts = struct('NumberNeighbors',40,'NumClusters',3,'LaplacianType', 'unnormalized'); 
    out = SpectralClusterer(X,Y, opts);
   x(i/5) = i; 
   times(i/5) = toc;
   i = i+5;
   i/1500
end