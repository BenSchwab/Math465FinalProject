function [ G,UserOpts ] = LaplacianBuilder( X, UserOpts)
%LAPLACIANBUILDER This function builds the Laplacian graph L,W,D, LRW,
%and LNormalized for the input DxN matrix.
%UserOpts struct with following options:
%       NumberNeighbors = number of neighbors to use for KNN
%       NumClusters =  number of clusters to segment data
%       NSDistance = distance metric. See knnsearch 'Distance' for options.
%                    defaults to 'Eucledian'                     

%Default options
Opts = {};
Opts.NumberNeighbors = 5;
Opts.NumClusters = 2;
Opts.NSDistance = 'euclidean';


%Populate User options
if nargin>1
    fn = fieldnames(UserOpts);
    for j=1:length(fn)
        name = fn{j};
        value = getfield(UserOpts, name);

        if     strcmpi(name,'NumberNeighbors')   Opts.NumberNeighbors = value;
        elseif     strcmpi(name,'NSDistnace')   Opts.NSDistance = value;
        elseif strcmpi(name,'NumClusters')       Opts.NumClusters = value;
       
        end
    end
end

%Initialize the variables
d = size(X,1);
n = size(X,2);
W = zeros(n,n);
D = zeros(n,n);
sigma = mean(std(X'));


%====================Build Laplacian ========================

WBuilderMatlab();
%WBuilderDiffusion();



for i = 1:n
    D(i,i) = sum(W(i,:)); 
end
L = D - W;

%============= Normalize Laplacian=======================
LS = sparse(L);
DS = sparse(D);
DSinv = DS^-1;
DShalf = sqrt(DS)^-1;


LNormalized = DShalf*LS*DShalf;

G.W = W;
G.D = D;
G.L = L;
G.LRW = DSinv*LS;
G.LNormalized = LNormalized;

UserOpts.times(2) = toc;

%============= Laplacian Building functions=======================
function WBuilderMatlab()
    tic
    [neighborArr,distances] = knnsearch(X',X','K',Opts.NumberNeighbors,'Distance',Opts.NSDistance);
    W = zeros(n,n);
    D = zeros(n,n);
    sigma = mean(std(X'));
    for i = 1:n
        neighbors = neighborArr(i,:);
        %neighbor_distances = dists{i};
            for j = 1:Opts.NumberNeighbors
                neighbor = neighbors(j);
                distance = distances(i,j);
                W(i, neighbor) = 1/(sigma + distance);
                W(neighbor, i) = 1/(sigma + distance);
            end
    end
    UserOpts.times(2) = toc;
end

function WBuilderDiffusion() 
    tic
    neighborArr = knnsearch(X',X','K',Opts.NumberNeighbors);
    W = zeros(n,n);
    D = zeros(n,n);
    sigma = mean(std(X'));
    for i = 1:n
        neighbors = neighborArr(i,:);
        %neighbor_distances = dists{i};
            for j = 1:Opts.NumberNeighbors
                neighbor = neighbors(j);
                distance = norm(X(:,i)-(X(:,neighbor)));
                W(i, neighbor) = 1/(sigma + distance);
                W(neighbor, i) = 1/(sigma + distance);
            end
    end
     UserOpts.times(2) = toc;
end



end

