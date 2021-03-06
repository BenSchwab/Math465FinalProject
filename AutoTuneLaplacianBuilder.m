function [ G ] = AutoTuneLaplacianBuilder( X, UserOpts)
%LAPLACIANBUILDER This function builds the Laplacian graph for the input
%DxN matrix.

%Default options
Opts = {};
Opts.NumberNeighbors = 40;
Opts.NumClusters = 2;

%Populate User options
if nargin>1
    fn = fieldnames(UserOpts);
    for j=1:length(fn)
        name = fn{j};
        value = getfield(UserOpts, name);

        if     strcmpi(name,'NumberNeighbors')   Opts.NumberNeighbors = value;
        elseif strcmpi(name,'NumClusters')       Opts.NumClusters = value;
       
        end
    end
end

d = size(X,1);
n = size(X,2);

G = GraphDiffusion(X, 0, struct('kEigenVecs', Opts.NumClusters, 'epsilon', 1.0, 'kNN', Opts.NumberNeighbors, 'kNNAutotune', 20));

W = G.W;
D = zeros(n,n);
for i = 1:n
    D(i,i) = sum(W(i,:)); 
end
L = D - W;


LNormalized = D^(-1/2)*L*D^(-1/2);

G.W = W;
G.D = D;
G.L = L;
G.LRW = D^(-1)*L;
G.LNormalized = LNormalized;
end

