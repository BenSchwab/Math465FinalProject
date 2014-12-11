function [ G,UserOpts ] = LaplacianBuilder( X, UserOpts)
%LAPLACIANBUILDER This function builds the Laplacian graph for the input
%DxN matrix.

%Default options
Opts = {};
Opts.NumberNeighbors = 5;
Opts.NumClusters = 2;

%By default do not combine the clusters
Opts.CombineClusters = 0;



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

%============Nearest Neighbor Search ========================

tic %time nearest neighbor search
[count,idxs, dists,NNInfo] = nrsearch(X, X, Opts.NumberNeighbors, 0);
UserOpts.times(1) = toc
toc
W = zeros(n,n);
D = zeros(n,n);
sigma = mean(std(X'));

%============Build Laplacian Info========================

tic %time constructing laplacian
for i = 1:n
    neighbors = idxs{i};
    neighbor_distances = dists{i};
    for j = 1:Opts.NumberNeighbors
        neighbor = neighbors(j);
        W(i, neighbor) = 1/(sigma + neighbor_distances(j));
        W(neighbor, i) = 1/(sigma + neighbor_distances(j));
    end
end

toc


for i = 1:n
    D(i,i) = sum(W(i,:)); 
end
L = D - W;
LS = sparse(L);
DS = sparse(D);
DSinv = DS^-1;
DShalf = sqrt(DS)^-1;


%LNormalized = D^(-1/2)*L*D^(-1/2);
LNormalized = DShalf*LS*DShalf;



G.W = W;
G.D = D;
G.L = L;
%G.LRW = D^(-1)*L;
G.LRW = DSinv*LS;
%G.LNormalized = LNormalized;
G.LNormalized = LNormalized;

UserOpts.times(2) = toc;
toc



end

