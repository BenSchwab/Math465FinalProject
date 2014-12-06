function [ G ] = SpectralClusterer(X, userOpts)
%CONSTRUCTUNORMALIZEDLAPLACIAN Construct an unormalized Laplacian for the 
%data

%Default options
Opts = {};
Opts.NumberNeighbors = 5;
Opts.NumClusters = 2;

%Populate User options
if nargin>1
    fn = fieldnames(userOpts);
    for j=1:length(fn)
        name = fn{j};
        value = getfield(Options, name);

        if     strcmpi(name,'NumberNeighbors')   Opts.NumberNeighbors = value;
        elseif strcmpi(name,'NumClusters')       Opts.NumClusters = value;
       
        end
    end
end

d = size(X,1);
n = size(X,2);

[count,idxs, dists,NNInfo] = nrsearch(X, X, Opts.NumberNeighbors, 0);

W = zeros(n,n);
D = zeros(n,n);
for i = 1:n
    neighbors = idxs{i};
    neighbor_distances = dists{i};
    for j = 1:Opts.NumberNeighbors
        neighbor = neighbors(j);
        W(i, neighbor) = 1/(1 + neighbor_distances(j));
        W(neighbor, i) = 1/(1 + neighbor_distances(j));
    end
end

for i = 1:n
    D(i,i) = sum(W(i,:)); 
end
L = D - W;


normalized = D^(-1/2)*L*D^(-1/2);
[EigenVec,EigenVal] = eig(L); 

U = EigenVec(:,1:Opts.NumClusters);
labels = kmeans(U, Opts.NumClusters);

G.W = W;
G.D = D;
G.L = L;
G.U = U;
G.labels = labels;
G.LNormalized = normalized;
G.EigenVec = EigenVec;
G.EigenVal = EigenVal;




end

