NumpointsTimes = {};
x = zeros(200,1);
times = zeros(200,5);
i = 40;
while i<1500
   [X,Y] = MNIST_helper([0,1,4,7],i); 
    tic;
    opts = struct('NumberNeighbors',40,'NumClusters',3,'LaplacianType', 'unnormalized'); 
   [out,g, t] = SpectralClusterer(X,Y, opts);
   x(i/10) = i; 
   times(i/10,:) = t;
   i = i+10;
   i/1500
end