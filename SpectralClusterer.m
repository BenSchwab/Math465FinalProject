function [ clusters ] = SpectralClusterer(X, Opts)


G = LaplacianBuilder(X,Opts);




[EigenVec,EigenVal] = eig(G.L); 
U = EigenVec(:,1:Opts.NumClusters);


clusters = kmeans(U, Opts.NumClusters);



end

