
pExampleNames   = { ...
    'twoBalls       Kmeans[O] Spectral[O]', ...
    'doubleHelix    Kmeans[X] Spectral[O]', ...
    'lineAndBlob    Kmeans[X] Spectral[X]', ...
    'denseSparse    Kmeans[X] Spectral[X]', ...
    'blobInSphere   Kmeans[X] Spectral[O]', ...
    'blobInSphere   Varying Variance', ...
    'blobInSphere   Varying Dimension', ...
    'doubleHelix    Varying Variance'};

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
        syntheticDataAnalyzer(X, Y, Opts);
    case 2
        Opts.name = 'doubleHelix';
        [X, Y] = doubleHelix(1000);
        syntheticDataAnalyzer(X, Y, Opts);
    case 3
        Opts.name = 'lineAndBlob';
        [X, Y] = lineAndBlob(1000, 1000);
        syntheticDataAnalyzer(X, Y, Opts);
    case 4
        Opts.name = 'denseAndSparseBlobs';
        [X, Y] = denseAndSparseBlobs(1000, 3);
        syntheticDataAnalyzer(X, Y, Opts);
    case 5
        Opts.name = 'blobInSphere';
        [X, Y] = blobInSphere(1000, 1000, 2);
        syntheticDataAnalyzer(X, Y, Opts);
    case 6
        Opts.savePlots = false;
        Opts.name = 'blobInSphere_varyDimension';
        % TODO increase variance
        [X, Y] = blobInSphere(1000, 1000, 2);
    case 7
        Opts.name = 'blobInSphere_varyVariance';
        
        blobSigmas = [0.5, .75, 1];
        sphereSigmas = [0.02, 0.05, 0.1];
        
        counter = 1;
        for i=1:length(blobSigmas)
            for j=1:length(sphereSigmas)
                blobSigma = blobSigmas(i);
                sphereSigma = sphereSigmas(j);
                
                blobInSphereOpts = struct('blobSigma',blobSigma,'sphereSigma',sphereSigma);
                [X, Y] = blobInSphere(1000, 1000, 2, blobInSphereOpts);
                [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));
                
                plotPosition = subplot(length(blobSigmas),length(sphereSigmas),counter);
                colormap(cool);
                scatter(plotPosition, X(1,:),X(2,:), 4, spectralLabelAssignments.Merged);
                title(strcat('blobSigma: ',num2str(blobSigma),', sphereSigma: ',num2str(sphereSigma)));
                
                counter = counter+1;
            end
        end
       
    case 8
        Opts.name = 'doubleHelix_varyVariance';
        
        strandSigmas = [0.1, 0.2, 0.25, 0.3];
        
        counter = 1;
        for i=1:length(strandSigmas)
            strandSigma = strandSigmas(i);
            doubleHelixOpts = struct('strandSigma',strandSigma);
            [X, Y] = doubleHelix(1000, doubleHelixOpts);
            [spectralLabelAssignments, ~] = SpectralClusterer(X, Y, struct('NumClusters', Opts.numberOfClusters, 'NumberNeighbors', Opts.numberOfNeighbors));

            plotPosition = subplot(1,4,counter);
            colormap(cool);
            scatter3(plotPosition, X(1,:),X(2,:), X(3,:), 4, spectralLabelAssignments.Merged);
            title(strcat('strandSigma: ',num2str(strandSigma)));

            counter = counter+1;
        end
end
