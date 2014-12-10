times = zeros(1000);
size = 6;
while size<784
 [X,Y] = MNIST_helper([0,1],500); 
  T = X(1:size,:);
 tic;
 opts = struct('NumberNeighbors',40,'NumClusters',3,'LaplacianType', 'unnormalized'); 
 out = SpectralClusterer(T,Y, opts);
 times(i/3) = toc;
 size = size +3;
 i/3
end





