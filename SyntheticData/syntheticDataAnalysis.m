
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
Opts.savePlots = false;
Opts.interval = 2; % 2 seconds between plot displays

% update settings on a per case basis
switch pExampleIdx
    case 1  
        Opts.name = 'twoBalls';
        [X, Y] = twoBalls(1000,2,3);
    case 2
        Opts.name = 'doubleHelix';
        [X, Y] = doubleHelix(1000);
    case 3
        Opts.name = 'lineAndBlob';
        [X, Y] = lineAndBlob(1000, 1000);
    case 4
        Opts.name = 'denseAndSparseBlobs';
        [X, Y] = denseAndSparseBlobs(1000, 3);
    case 5
        Opts.name = 'blobInSphere';
        [X, Y] = blobInSphere(1000, 1000, 2);
end

syntheticDataAnalyzer(X, Y, Opts);
