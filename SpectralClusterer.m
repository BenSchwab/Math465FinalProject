function [ clusters ] = SpectralClusterer(X, Opts)

auto = 0;
if isfield(Opts, 'auto')
    auto = getfield(Opts, 'auto');
end
if auto
    G = AutoTuneLaplacianBuilder(X,Opts);
else
    G = LaplacianBuilder(X,Opts);
end




[EigenVec,EigenVal] = eig(G.L); 
U = EigenVec(:,1:Opts.NumClusters);


clusters = kmeans(U, Opts.NumClusters);

end

