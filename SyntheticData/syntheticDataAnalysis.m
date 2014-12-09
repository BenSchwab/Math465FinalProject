
pExampleNames   = { ...
    'twoBalls', ...
    'doubleHelix', ...
    'lineAndBlob' };

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

switch pExampleIdx
    case 1  
        [X, Y] = twoBalls(1000,2,3);
        Opts.numberOfClusters = 2;
        Opts.numberOfNeighbors = 70;
        syntheticDataAnalyzer(X, Y, Opts);
    case 2
        [X, Y] = doubleHelix(1000);
        Opts.numberOfClusters = 2;
        Opts.numberOfNeighbors = 70;
        syntheticDataAnalyzer(X, Y, Opts);
    case 3
        [X, Y] = lineAndBlob(1000, 1000);
        Opts.numberOfClusters = 2;
        Opts.numberOfNeighbors = 70;
        syntheticDataAnalyzer(X, Y, Opts);
end
