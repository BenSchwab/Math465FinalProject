
pExampleNames   = { ...
    'twoBalls       Kmeans[O] Spectral[O]', ...
    'doubleHelix    Kmeans[X] Spectral[O]', ...
    'lineAndBlob    Kmeans[X] Spectral[X]', ...
    'denseSparse    Kmeans[X] Spectral[X]', ...
    'blobInSphere   Kmeans[X] Spectral[O]'};

fprintf('\n\n Select example to run:\n');
for k = 1:length(pExampleNames),
    fprintf('\n [%d] %s',k,pExampleNames{k});
end;
fprintf('\n\n  ');

while true,
    try
        pExampleIdx = input('');
        pExampleIdx = str2num(pExampleIdx);
    catch
    end;
    if (pExampleIdx>=1) && (pExampleIdx<=length(pExampleNames)),
        break;
    else
        fprintf('\n %d is not a valid Example. Please select a valid Example above.',pExampleIdx);
        pExampleIdx=0;
    end;
end;

% default settings
Opts.numberOfClusters = 2;
Opts.numberOfNeighbors = 70;

switch pExampleIdx
    case 1  
        [X, Y] = twoBalls(1000,2,3);
        syntheticDataAnalyzer(X, Y, Opts);
    case 2
        [X, Y] = doubleHelix(1000);
        syntheticDataAnalyzer(X, Y, Opts);
    case 3
        [X, Y] = lineAndBlob(1000, 1000);
        syntheticDataAnalyzer(X, Y, Opts);
    case 4
        [X, Y] = denseAndSparseBlobs(1000, 3);
        syntheticDataAnalyzer(X, Y, Opts);
    case 5
        [X, Y] = blobInSphere(1000, 1000, 2);
        syntheticDataAnalyzer(X, Y, Opts);
end
