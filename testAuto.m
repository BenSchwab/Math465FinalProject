numClusters = 20;
[X,Y] = MNIST_helper([0,1,2,3,4,5,6,7,8,9], 600); 
G = GraphDiffusion(X, 0, struct('kEigenVecs', numClusters, 'epsilon', 1.0, 'kNN', 40, 'kNNAutotune', 20));

d = size(X,1);
n = size(X,2);

D = zeros(n,n);

W = G.W;
L = D - W;

[EigenVec,EigenVal] = eig(L); 
U = EigenVec(:,1:numClusters);


clusters = kmeans(U, numClusters);
ClusterPurity(clusters, Y, numClusters)